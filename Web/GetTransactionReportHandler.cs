using Accounts.Core;
using Web.Controllers;

namespace Web
{
    public class GetTransactionReportHandler : Handler
    {
        public TransactionReport Handle(GetTransactionQueryModel query)
        {
            var reporter = new TransactionReporter();
        
            var result = reporter.GetTransactionReport(Context.UserContext.Database, Context.UserContext.CompanyId, query.DateFrom, query.DateTo );

            return result;
        }
    }
}