using System;
using System.Collections.Generic;

namespace Accounts.Core
{
    public class TransactionReport
    {
        public TransactionReport()
        {
        }

        public TransactionReport(DateTime from, DateTime to)
        {
            Name = "Transaction Report";
            DateFrom = from.ToString("D");
            DateTo = to.ToString("D");
            Quarters = new List<TransactionReportQuarter>();
        }

        public string Name { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public List<TransactionReportQuarter> Quarters { get; set; }
    }

    public class TransactionReportQuarter
    {
        public TransactionReportQuarter()
        {
            Quarter = new Quarter();
            Balance = 0;
            TotalForQuarter = 0;
            TotalTransactions = 0;
            TransactionReportItems = new List<TransactionReportItem>();
        }

        public decimal TotalForQuarter { get; set; }
        public decimal Balance { get; set; }
        public int TotalTransactions { get; set; }
        public Quarter Quarter { get; set; }
        public List<TransactionReportItem> TransactionReportItems { get; set; }
    }
}