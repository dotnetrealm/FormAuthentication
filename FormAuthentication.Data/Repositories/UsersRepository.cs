using FormAuthentication.Data.Interfaces;
using Microsoft.Extensions.Configuration;
using System.Data.SqlClient;

namespace FormAuthentication.Data.Repositories;

public class UsersRepository : IUsersRepository
{
    readonly IConfiguration _config;
    public UsersRepository(IConfiguration configuration) { 
        _config = configuration;
    }    
    public async Task<bool> UserLogin(string username, string password)
    {

        try
        {
            using var connection=  new SqlConnection(_config.GetConnectionString("DefaultConnection"));
            connection.Open();
            SqlCommand cmd = new SqlCommand("SELECT Count(*) FROM [dbo].[User] WHERE Username = @UserName and Password = @Password", connection);
            cmd.Parameters.AddWithValue("Username", username);
            cmd.Parameters.AddWithValue("Password", password);

            int? reader = (int?) await cmd.ExecuteScalarAsync();
            return reader > 0;
        }
        catch (Exception ex)
        {

            Console.WriteLine(ex);
        }
        return false;
    }
}
