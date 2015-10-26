using System;
using Accounts.Core;
using NPoco;

namespace ImportAccounts
{
    class Program
    {
        static void Main(string[] args)
        {
            var systemDatabase = new Database("ImportAccounts");
            systemDatabase.OpenSharedConnection();

            var file = "Goelearning_Transactions-AllAccounts-FY2015.csv";
            var loadedFile = FileLoadHelper.LoadFile(file);
            var transactions = FileLoadHelper.GetTransactions(loadedFile);

            TransactionPersister.SaveTransactions(systemDatabase, transactions);
            
            //TransactionPersister.CreateBankAccountsWithZeroBalanceIfNotExist(systemDatabase, transactions);
            
            TransactionPersister.BuildReconciles(systemDatabase);

            TransactionPersister.UpdateRunningBalances(systemDatabase);


            foreach (var x in transactions)
            {
                Console.WriteLine(x.ToJsonString() + Environment.NewLine);
            }
            var reporter = new TransactionReporter();

            var goelearningCompanyid = 1;
            var report = reporter.GetTransactionReport(systemDatabase, goelearningCompanyid, new DateTime(2014, 7, 1), new DateTime(2015, 6, 30));

            Console.WriteLine(report.ToJsonString());
        }
    }
}
