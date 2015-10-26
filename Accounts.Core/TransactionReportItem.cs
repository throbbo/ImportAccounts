using System;

namespace Accounts.Core
{
    public class TransactionReportItem
    {
        public string Line { get; set; }
        public string BankAccount { get; set; }
        public DateTime TransactionDate { get; set; }
        public decimal Amount { get; set; }
        public decimal BalanceAfter { get; set; }
        public string Category { get; set; }
        public string TransactionDateStr { get; set; }
        public int TransactionId { get; set; }
        public decimal OpeningBalance { get; set; }
        public int Quarter { get; set; }
        public string OpeningBalanceDisplay { get; set; }
    }
}