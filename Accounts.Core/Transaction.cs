using System;
using NPoco;

namespace Accounts.Core
{
    [TableName("Transactions")]
    [PrimaryKey("TransactionId")]
    public class Transaction
    {
        public Transaction()
        {
        }

        public Transaction(int transactionId)
        {
            TransactionId = transactionId;
        }

        public int TransactionId { get; private set; }
        public string AccountNumber { get; set; }
        public DateTime TransactionDate { get; set; }
        public string Narrative { get; set; }
        public decimal DebitAmount { get; set; }
        public decimal CreditAmount { get; set; }
        public string Categories { get; set; }
        public string Serial { get; set; }
    }
}