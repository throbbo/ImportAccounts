using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NPoco;

namespace Accounts.Core
{
    [TableName("bankaccounts"), PrimaryKey("bankaccountid")]
    public class BankAccount
    {
        public int Bankaccountid { get; set; }
        public int CompanyId { get; set; }
        public string Accountnumber { get; set; }
        public decimal Openingbalance { get; set; }
        public DateTime Openingbalancedate { get; set; }
    }
}