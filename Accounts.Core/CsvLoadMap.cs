using CsvHelper.Configuration;

namespace Accounts.Core
{
    public class CsvLoadMap : CsvClassMap<LineItemLoad>
    {
        public CsvLoadMap()
        {
            Map(x => x.AccountNumber).Index(0);
            Map(x => x.TransactionDate).Index(1);
            Map(x => x.Narrative).Index(2);
            Map(x => x.DebitAmount).Index(3);
            Map(x => x.CreditAmount).Index(4);
            Map(x => x.Categories).Index(5);
            Map(x => x.Serial).Index(6);
        }
    }
}