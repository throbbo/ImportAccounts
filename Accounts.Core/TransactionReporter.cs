using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NPoco;

namespace Accounts.Core
{
    public static class GlobalHelper
    {
        public static string FormatStandardStr(this DateTime inDate)
        {
            if (inDate == null) return "";

            return inDate.ToString("yyyy-MM-dd");
        }
    }
    public class TransactionReporter
    {
        public TransactionReport GetTransactionReport(IDatabase db, int companyId, DateTime from, DateTime to)
        {
            var bankAccounts = db.Query<BankAccount>().Where(x => x.CompanyId == companyId).ToList();

            var transactions = db.Fetch<TransactionView>(@"select * from transactionview v 
where exists(
select * from bankaccounts b where  b.companyid = @0 and b.Accountnumber = v.AccountNumber )",
                companyId).ToList();

            var report = new TransactionReport(from, to);
            
            var quarters = QuarterHelper.GetQuarters(from, to);
            foreach (var quarter in quarters)
            {
                var reportQuarter = new TransactionReportQuarter {Quarter = quarter};

                foreach (var account in bankAccounts)
                {
                    var currentBalance = 0m;

                    if (from <= reportQuarter.Quarter.StartDate && to >= reportQuarter.Quarter.EndDate)
                    {
                        currentBalance = account.Openingbalance;

                        reportQuarter.TransactionReportItems.Add(new TransactionReportItem
                        {
                            BankAccount = account.Accountnumber,
                            Amount = currentBalance,
                            BalanceAfter = currentBalance,
                            TransactionDate = account.Openingbalancedate,
                            TransactionDateStr = account.Openingbalancedate.FormatStandardStr(),
                            Line = "Opening Balance as at " + account.Openingbalancedate.ToString("D")
                        });
                    }

                    foreach (var transaction in transactions.Where(x => x.AccountNumber == account.Accountnumber && x.TransactionDate >= reportQuarter.Quarter.StartDate && x.TransactionDate <= reportQuarter.Quarter.EndDate))
                    {
                        reportQuarter.TransactionReportItems.Add(new TransactionReportItem
                        {
                            BankAccount = account.Accountnumber,
                            Category = transaction.Account,
                            Amount = transaction.Amount,
                            BalanceAfter = currentBalance - transaction.Amount,
                            TransactionDate = transaction.TransactionDate,
                            TransactionDateStr = 
                                (transaction.TransactionDate == new DateTime(1, 1, 1)
                                    ? ""
                                    : transaction.TransactionDate.ToString("yyyy-MM-dd")),
                            Line = transaction.Description
                        });

                        reportQuarter.Balance += transaction.Amount;
                        reportQuarter.TotalForQuarter += transaction.Amount;
                        reportQuarter.TotalTransactions++;

                    }

                    report.Quarters.Add(reportQuarter);
                }
            }

            return report;
        }

        public TransactionsAllReport GetTransactionsAllReport(IDatabase db, int companyId, DateTime from, DateTime to)
        {
            var transactions = db.Fetch<TransactionView>(@"
select * 
from transactionview v 
inner join runningbalance rb on rb.transactionid = v.transactionid
where  v.companyid = @0", companyId).OrderBy(x => x.Account).ThenBy(y => y.TransactionDate).ThenBy(z => z.TransactionId).ToList();

            var report = new TransactionsAllReport(from, to);
            
            var account = "";
            foreach (var t in transactions)
            {
                var currentBalance = 0m;
                var balDispaly = (account != t.AccountNumber) ? (t.Balance + t.Amount).ToString("C") : "";
                account = t.AccountNumber;

                report.TransactionReportItems.Add(new TransactionReportItem
                {
                    BankAccount = t.AccountNumber,
                    Amount = t.Amount,
                    BalanceAfter = t.Balance,
                    OpeningBalance = t.Balance + t.Amount,
                    OpeningBalanceDisplay = balDispaly,
                    Category = t.Category,
                    TransactionDate = t.TransactionDate,
                    TransactionDateStr = t.TransactionDate.ToString("yyyy-MM-dd"),
                    TransactionId = t.TransactionId,
                    Quarter = GetQuarter(t.TransactionDate)
                });
            }

            return report;
        }

        private int GetQuarter(DateTime transactionDate)
        {
            var m = transactionDate.Month;
            if (m >= 7 && m <= 9) return 1;
            if (m >= 10 && m <= 12) return 2;
            if (m >= 1 && m <= 3) return 3;
            
            return 4;
        }
    }

    [PrimaryKey("RunningBalanceId")]
    public class RunningBalance
    {
        public int RunningBalanceId { get; set; }
        public int Bankaccountid { get; set; }
        public DateTime Balancedate { get; set; }
        public decimal Balance { get; set; }
    }


    public class TransactionsAllReport
    {
        public TransactionsAllReport()
        {
        }

        public TransactionsAllReport(DateTime from, DateTime to)
        {
            Name = "Transactions All Report";
            DateFrom = from.ToString("D");
            DateTo = to.ToString("D");
            FinancialYear = to.Year;
            TransactionReportItems = new List<TransactionReportItem>();
        }

        public int FinancialYear { get; set; }
        public string Name { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public List<TransactionReportItem> TransactionReportItems { get; set; }
    }

    public static class QuarterHelper
    {
        public static List<Quarter> GetQuarters()
        {
            var startDate = new DateTime(2014, 7, 1);
            var quarters = new List<Quarter>();
            int quarter = 0;
            for (int i = 0; i < 15; i++)
            {
                int yearAdd = Convert.ToInt32(Math.Floor(1m * i / 4m));
                Math.DivRem(i+1, 4, out quarter);
                if (quarter == 0) quarter = 4;
                var date = startDate.AddMonths(i*3);
                var endDate = date.AddMonths(3).AddDays(-1);
                quarters.Add(new Quarter { QuarterNo = quarter, FinancialYear = 2015 + yearAdd, StartDate = date, EndDate = endDate });
            }
            return quarters;
        }

        public static List<Quarter> GetQuarters(DateTime from, DateTime to)
        {
            var quarters = QuarterHelper.GetQuarters().Where(x => x.StartDate >= from && x.EndDate <= to).ToList();
            return quarters;
        }
    }

    public class Quarter
    {
        public int QuarterNo { get; set; }
        public int FinancialYear { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}