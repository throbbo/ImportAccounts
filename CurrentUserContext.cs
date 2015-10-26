using NPoco;

namespace ImportAccounts
{
    public class CurrentUserContext
    {
        public IDatabase Database { get; set; }
        public int UserId { get; set; }
        public int CompanyId { get; set; }
    }
}