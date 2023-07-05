namespace FormAuthentication.Data.Interfaces
{
    public interface IUsersRepository
    {
        Task<bool> UserLogin(string username, string password);
    }
}
