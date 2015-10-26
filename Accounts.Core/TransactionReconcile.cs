using System;
using NPoco;

namespace Accounts.Core
{
    [TableName("TransactionReconciles")]
    [PrimaryKey("transactionReconcileId")]
    public class TransactionReconcile
    {
        public int TransactionReconcileId { get; set; }
        public int TransactionId { get; set; }
        public string Category { get; set; }
        public decimal Amount { get; set; }
        public string GstType { get; set; }
        public decimal Gst { get; set; }
        public string Description { get; set; }
        public bool Reconciled { get; set; }
    }


    [TableName("TransactionView")]
    public class TransactionView
    {
        public int TransactionId { get; set; }
        public string AccountNumber { get; set; }
        public DateTime TransactionDate { get; set; }
        public string Narrative { get; set; }
        public decimal DebitAmount { get; set; }
        public decimal CreditAmount { get; set; }
        public string Categories { get; set; }
        public string Serial { get; set; }
        public string Category { get; set; }
        public decimal Amount { get; set; }
        public decimal Balance { get; set; }
        public string GstType { get; set; }
        public decimal Gst { get; set; }
        public string Account { get; set; }
        public string Description { get; set; }
        public bool Reconciled { get; set; }
    }
}