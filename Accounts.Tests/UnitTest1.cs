using System;
using System.Linq;
using Accounts.Core;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Accounts.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            var from = new DateTime(2014, 7, 1);
            var to = new DateTime(2015, 6, 30);

            var quarters = QuarterHelper.GetQuarters(from, to);
            var quarters2 = QuarterHelper.GetQuarters();

            Assert.AreEqual(quarters.Count(), 4);
            Assert.AreEqual(quarters.First().FinancialYear, 2015);
            Assert.AreEqual(quarters.First().QuarterNo, 1);
            Assert.AreEqual(quarters.Last().QuarterNo, 4);
            
        }
    }
}
