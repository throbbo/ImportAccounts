using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web.UI.WebControls;
using NPoco;

namespace Accounts.Core
{
    public class TransactionPersister
    {
        public static int SaveTransactions(Database db, List<Transaction> transactions)
        {
            var newTransactionsLoaded = 0;
            var insertedRowIds = new List<int>();

            db.BeginTransaction();

            foreach (var t in transactions)
            {
                var txn = db.Query<Transaction>().Where(x => x.AccountNumber == t.AccountNumber && x.TransactionDate == t.TransactionDate
                                                                && !insertedRowIds.Contains(x.TransactionId)).FirstOrDefault();
                if(txn == null)
                {
                    newTransactionsLoaded++;

                    insertedRowIds.Add(Convert.ToInt32(db.Insert(t)));
                }
            }

            db.CompleteTransaction();

            return newTransactionsLoaded;
        }

        public enum AccountCategory
        {
            Expense,
            Revenue,
            Asset,
            Liability,
            Equity,
            AccountTransferOut,
            AccountTransferIn
        }

        public enum GstCategory
        {
            Free = 0,
            InputTaxed = 0,
            Gst = 10
        }

        public static void BuildReconciles(Database db)
        {
            var reconciles = db.Fetch<int>("select TransactionId from TransactionReconciles");

            var transactions = db.Query<Transaction>().Where(x => !reconciles.Contains(x.TransactionId)).ToList();

            foreach (var transaction in transactions)
            {
                var rec = CategoriseTransaction(transaction);

                db.Insert(rec);
            }
        }

        private static TransactionReconcile CategoriseTransaction(Transaction transaction)
        {
            var reconcile = new TransactionReconcile { TransactionId = transaction.TransactionId, Description = transaction.Narrative, Gst = 0 };
            var description = transaction.Narrative.ToUpper();

            if (transaction.Categories.Contains("FEE") || transaction.Categories.Contains("INT"))
            {
                reconcile.Category = AccountCategory.Expense.ToString();
                reconcile.Amount = GetAmountNegative(transaction);
                reconcile.GstType = GstCategory.Gst.ToString();
            }

            if (transaction.Categories.Contains("CREDIT"))
            {
                reconcile.Category = AccountCategory.AccountTransferIn.ToString();
                reconcile.Amount = GetAmountAbsolute(transaction);
                reconcile.Description = "Transfer In";
                reconcile.GstType = GstCategory.Free.ToString();
            }

            if (transaction.Categories.Contains("PAYMENT"))
            {
                if (description.Contains("TFR"))
                {
                    reconcile.Category = AccountCategory.AccountTransferOut.ToString();
                    reconcile.Description = "Transfer Out";
                    reconcile.Amount = GetAmountNegative(transaction);
                }

                if (description.Contains("PYMNT"))
                {
                    reconcile.Category = AccountCategory.Expense.ToString();
                    reconcile.Amount = GetAmountAbsolute(transaction);
                    reconcile.Description = transaction.Narrative + " - Royalties/Payments";
                    reconcile.GstType = GstCategory.Gst.ToString();
                }

                if (description.Contains("ASIC") || description.Contains("ATO") )
                {
                    reconcile.Category = AccountCategory.Expense.ToString();
                    reconcile.Amount = GetAmountNegative(transaction);
                    reconcile.Description = transaction.Narrative + "ASIC EXPENSE";
                    reconcile.GstType = GstCategory.Free.ToString();
                }

                reconcile.Category = AccountCategory.Expense.ToString();
                reconcile.Amount = GetAmountNegative(transaction);
                reconcile.Description = transaction.Narrative + " - EXPENSE OTHER";
                reconcile.GstType = GstCategory.Gst.ToString();
            }

            if (transaction.Categories.Contains("DEP"))
            {
                // Receive Money
                if (description.Contains("FUNDS TFR"))
                {
                    reconcile.Category = AccountCategory.AccountTransferIn.ToString();
                    reconcile.Amount = GetAmountAbsolute(transaction);
                    reconcile.Description = "Transfer In";
                    reconcile.GstType = GstCategory.Free.ToString();
                }

                reconcile.Category = AccountCategory.Revenue.ToString();
                reconcile.Amount = GetAmountAbsolute(transaction);
                reconcile.Description = transaction.Narrative + " - INCOME";
                reconcile.GstType = GstCategory.Free.ToString();
            }

            if (transaction.Categories.Contains("XFER"))
            {
                // Transfer Out for Payment mostly
                reconcile.Category = AccountCategory.AccountTransferOut.ToString();
                reconcile.Description = "Transfer Out";
                reconcile.Amount = GetAmountNegative(transaction);
                reconcile.GstType = GstCategory.Free.ToString();
            }

            reconcile.Gst = GetGstAmount(reconcile);

            return reconcile;
        }

        private static decimal GetGstAmount(TransactionReconcile reconcile)
        {
            if (reconcile.GstType == GstCategory.Free.ToString()) return 0;
            if (reconcile.GstType == GstCategory.InputTaxed.ToString()) return 0;
            if (reconcile.GstType == GstCategory.Gst.ToString()) return Math.Round(reconcile.Amount / 11m, 2);

            return 0;
        }

        private static decimal GetAmountNegative(Transaction transaction)
        {
            return -1 * GetAmountAbsolute(transaction);
        }

        private static decimal GetAmountAbsolute(Transaction transaction)
        {
            var amount = Math.Abs(transaction.CreditAmount);
            if (amount == 0)
            {
                amount = Math.Abs(transaction.DebitAmount);
            }

            return amount;
        }

        public static void CreateBankAccountsWithZeroBalanceIfNotExist(Database systemDatabase, List<Transaction> transactions)
        {
            // TODO: Implement 
        }

        public static void UpdateRunningBalances(Database db)
        {
            db.Execute("exec sp_updaterunningbalance");
        }
    }
}