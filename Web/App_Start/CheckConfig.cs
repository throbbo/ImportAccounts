using System;
using System.IO;
using System.Web;
using Web;

[assembly: PreApplicationStartMethod(typeof(CheckConfig), "Start")]
namespace Web
{
    public static class CheckConfig
    {
        public static void Start()
        {
            if (!File.Exists(System.Web.Hosting.HostingEnvironment.MapPath("~/connectionStrings.config")))
            {
                throw new Exception("connectionStrings.config is missing");
            }
        }
    }
}