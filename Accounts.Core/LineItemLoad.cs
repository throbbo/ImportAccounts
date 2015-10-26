namespace Accounts.Core
{
    public class LineItemLoad
    {
        public string AccountNumber { get; set; }
        public string TransactionDate { get; set; }
        public string Narrative { get; set; }
        public string DebitAmount { get; set; }
        public string CreditAmount { get; set; }
        public string Categories { get; set; }
        public string Serial { get; set; }
    }
}