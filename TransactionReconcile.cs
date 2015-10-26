using NPoco;

namespace ImportAccounts
{
    [TableName("TransactionReconciles")]
    [PrimaryKey("transactionreconcileid")]
    public class TransactionReconcile
    {
        [Column("transactionreconcileid")]
        public int Transactionreconcileid { get; set; }
        [Column("transactionid")]
        public int Transactionid { get; set; }
        [Column("category")]
        public string Category { get; set; }
        [Column("amount")]
        public decimal Amount { get; set; }
        [Column("gstType")]
        public string Gsttype { get; set; }
        [Column("gst")]
        public decimal Gst { get; set; }
        [Column("account")]
        public string Account { get; set; }
        [Column("description")]
        public string Description { get; set; }
    }
}