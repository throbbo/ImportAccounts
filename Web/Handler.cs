using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ImportAccounts;
using NPoco;

namespace Web
{
    public class Handler
    {
        public Handler()
        {
            Context = new HandlerContext();
        }

        public HandlerContext Context { get; set; }
    }

    public class HandlerContext
    {
        public HandlerContext()
        {
            UserContext = new CurrentUserContext
            {
                Database = new Database("ImportAccounts"), 
                UserId = 1, 
                CompanyId = 1
            };
        }

        public CurrentUserContext UserContext { get; set; }
    }
}