using Accounts.Core;
using Web.Controllers;

namespace Web
{
    public class GetTransactionsAllReportHandler : Handler
    {
        public TransactionsAllReport Handle(GetTransactionQueryModel query)
        {
            var reporter = new TransactionReporter();
        
            var result = reporter.GetTransactionsAllReport(Context.UserContext.Database, Context.UserContext.CompanyId, query.DateFrom, query.DateTo );

            return result;
        }
    }
}