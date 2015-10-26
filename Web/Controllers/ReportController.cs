using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Util;
using Accounts.Core;
using NPoco;

namespace Web.Controllers
{
    public class ReportController : Controller
    {
        //
        // GET: /Transaction/

        public ActionResult Index()
        {
           return Content("Add reports list here");
        }

        public ActionResult TransactionsAll(GetTransactionQueryModel query)
        {
            var systemDatabase = new Database("ImportAccounts");
            systemDatabase.OpenSharedConnection();

            var handler = new GetTransactionsAllReportHandler();
            var result = handler.Handle(query);

            return View(result);
        }

        public ActionResult Transactions(GetTransactionQueryModel query)
        {
            var systemDatabase = new Database("ImportAccounts");
            systemDatabase.OpenSharedConnection();

            var handler = new GetTransactionReportHandler();
            var result = handler.Handle(query);

            return View(result);
        }
    }

    public class GetTransactionQueryModel
    {
        public GetTransactionQueryModel()
        {
            DateFrom = new DateTime(2014, 7, 1);
            DateTo = new DateTime(2015, 6, 30);
        }

        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
    }
}
