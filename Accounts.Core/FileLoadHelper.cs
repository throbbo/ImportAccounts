using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using CsvHelper;
using CsvHelper.Configuration;
using Microsoft.SqlServer.Server;

namespace Accounts.Core
{
    public static class FileLoadHelper
    {
        public static List<LineItemLoad> LoadFile(string fileName)
        {
            var result = LoadData(fileName);

            return result;
        }

        public static List<LineItemLoad> LoadData(string fileName)
        {
            IEnumerable<LineItemLoad> records;

            var csvConfig = new CsvConfiguration { HasHeaderRecord = true, Delimiter = ",", WillThrowOnMissingField = false, IgnoreBlankLines = true };
            using (var r = new CsvReader(new StreamReader(fileName), csvConfig))
            {
                r.Configuration.RegisterClassMap<CsvLoadMap>();
                records = r.GetRecords<LineItemLoad>().ToList();
            }

            var data = records.ToList();
            return data;
        }

        public static string ReadAllText(this Stream stream)
        {
            return new StreamReader(stream).ReadToEnd();
        }

        public static byte[] ReadAllBytes(this Stream stream)
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                byte[] buffer = new byte[4096];
                for (int count = stream.Read(buffer, 0, 4096); count > 0; count = stream.Read(buffer, 0, 4096))
                    memoryStream.Write(buffer, 0, count);
                return memoryStream.ToArray();
            }
        }

        public static List<Transaction> GetTransactions(List<LineItemLoad> loadedFile)
        {
            var transactions = new List<Transaction>();
            foreach (var item in loadedFile)
            {
                var transaction = new Transaction
                {
                    AccountNumber = ParseAccountNumber(item.AccountNumber, "WESTPAC"),
                    Narrative = item.Narrative,
                    Categories = item.Categories,
                    Serial = item.Serial
                };
                decimal amt;
                if (Decimal.TryParse(item.DebitAmount, out amt))
                {
                    transaction.DebitAmount = amt;
                };
                if (Decimal.TryParse(item.CreditAmount, out amt))
                {
                    transaction.CreditAmount = amt;
                };

                transaction.TransactionDate = Convert.ToDateTime(item.TransactionDate);

                transactions.Add(transaction);
            }

            return transactions;
        }

        private static string ParseAccountNumber(string accountNumber, string bankType)
        {
            if (bankType == "WESTPAC" && accountNumber.Length < 12)
            {
                // zeroes have been stripped from the front
                return accountNumber.PadLeft(12, '0');
            }

            if(accountNumber.Length>12) return accountNumber;

            return accountNumber.PadLeft(12, '0');
        }
    }
}