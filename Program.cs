using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;
using CsvHelper;
using CsvHelper.Configuration;
using Newtonsoft.Json;
using NPoco;

namespace ImportAccounts
{
    class Program
    {
        static void Main(string[] args)
        {
            var file = "Goelearning_Transactions-AllAccounts-FY2015.csv";
            var loadedFile = FileLoadHelper.LoadFile(file);
            var transactions = TransactionPersister.GetTransactions(loadedFile);
            TransactionPersister.SaveTransactions(transactions);

            foreach (var x in transactions)
            {
                Console.WriteLine(x.ToJsonString() + Environment.NewLine);
            }
        }
    }

    public class TransactionPersister
    {
        public static int SaveTransactions(List<Transaction> transactions)
        {
            var newTransactionsLoaded = 0;

            using (var db = new Database(@"Server=NAS2\SQLSERVER2008R2;Database=GoAccounts;User Id=sa;Password=1nl0g1k;", DatabaseType.SqlServer2008))
            {
                foreach (var t in transactions)
                {
                    var txn = db.Query<Transaction>().Where(x => x.AccountNumber == t.AccountNumber && x.PurchaseDate == t.PurchaseDate);
                    if(txn != null)
                    {
                        newTransactionsLoaded++;

                        db.Insert(t);
                    }
                }
            }
            

            return newTransactionsLoaded;
        }

        public static List<Transaction> GetTransactions(List<LineItemLoad> loadedFile)
        {
            var transactions = new List<Transaction>();
            foreach (var item in loadedFile)
            {
                var transaction = new Transaction { AccountNumber = item.AccountNumber,
                    Narrative = item.Narrative,
                    Categories = item.Categories,
                    Serial = item.Serial };
                decimal amt;
                if (Decimal.TryParse(item.DebitAmount, out amt))
                {
                    transaction.DebitAmount = amt;
                };
                if (Decimal.TryParse(item.CreditAmount, out amt))
                {
                    transaction.CreditAmount = amt;
                };

                transaction.PurchaseDate = Convert.ToDateTime(item.PurchaseDate);

                transactions.Add(transaction);
            }

            return transactions;
        }
    }

    [TableName("Transactions")]
    public class Transaction
    {
        public string AccountNumber { get; set; }
        public DateTime PurchaseDate { get; set; }
        public string Narrative { get; set; }
        public decimal DebitAmount { get; set; }
        public decimal CreditAmount { get; set; }
        public string Categories { get; set; }
        public string Serial { get; set; }
    }

    public class LineItemLoad
    {
        public string AccountNumber { get; set; }
        public string PurchaseDate { get; set; }
        public string Narrative { get; set; }
        public string DebitAmount { get; set; }
        public string CreditAmount { get; set; }
        public string Categories { get; set; }
        public string Serial { get; set; }
    }

    public class CsvLoadMap : CsvClassMap<LineItemLoad>
    {
        public CsvLoadMap()
        {
            Map(x => x.AccountNumber).Index(0);
            Map(x => x.PurchaseDate).Index(1);
            Map(x => x.Narrative).Index(2);
            Map(x => x.DebitAmount).Index(3);
            Map(x => x.CreditAmount).Index(4);
            Map(x => x.Categories).Index(5);
            Map(x => x.Serial).Index(6);
        }
    }

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
    }

    public static class Extensions
    {
        public static string ToJsonString(this object theObject, bool useIndentation = true, bool ignoreNullValues = false)
        {
            var jsonSettings = new JsonSerializerSettings
            {
                NullValueHandling = ignoreNullValues ? NullValueHandling.Ignore : NullValueHandling.Include
            };

            return JsonConvert.SerializeObject(theObject, jsonSettings);
        }
    }

  public static class StringExtensions
  {
    public static string CombineToPath(this string path, string root)
    {
      if (Path.IsPathRooted(path))
        return path;
      return Path.Combine(root, path);
    }

    public static void IfNotNull(this string target, Action<string> continuation)
    {
      if (target == null)
        return;
      continuation(target);
    }

    public static string ToFullPath(this string path)
    {
      return Path.GetFullPath(path);
    }

    public static string ParentDirectory(this string path)
    {
      return Path.GetDirectoryName(path.TrimEnd(Path.DirectorySeparatorChar));
    }
    
    public static bool IsEmpty(this string stringValue)
    {
      return string.IsNullOrEmpty(stringValue);
    }

    public static bool IsNotEmpty(this string stringValue)
    {
      return !string.IsNullOrEmpty(stringValue);
    }

    public static void IsNotEmpty(this string stringValue, Action<string> action)
    {
      if (!StringExtensions.IsNotEmpty(stringValue))
        return;
      action(stringValue);
    }

    public static bool ToBool(this string stringValue)
    {
      if (string.IsNullOrEmpty(stringValue))
        return false;
      return bool.Parse(stringValue);
    }

    public static string ToFormat(this string stringFormat, params object[] args)
    {
      return string.Format(stringFormat, args);
    }

    public static bool EqualsIgnoreCase(this string thisString, string otherString)
    {
      return thisString.Equals(otherString, StringComparison.InvariantCultureIgnoreCase);
    }

    public static string Capitalize(this string stringValue)
    {
      return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(stringValue);
    }

    public static string ConvertCRLFToBreaks(this string plainText)
    {
      return new Regex("(\r\n|\n)").Replace(plainText, "<br/>");
    }

    public static DateTime ToDateTime(this string dateTimeValue)
    {
      return DateTime.Parse(dateTimeValue);
    }

    public static string ToGmtFormattedDate(this DateTime date)
    {
      return date.ToString("yyyy'-'MM'-'dd hh':'mm':'ss tt 'GMT'");
    }

    public static string[] ToDelimitedArray(this string content)
    {
      return StringExtensions.ToDelimitedArray(content, ',');
    }

    public static string[] ToDelimitedArray(this string content, char delimiter)
    {
      string[] strArray = content.Split(delimiter);
      for (int index = 0; index < strArray.Length; ++index)
        strArray[index] = strArray[index].Trim();
      return strArray;
    }

    public static bool IsValidNumber(this string number)
    {
      return StringExtensions.IsValidNumber(number, Thread.CurrentThread.CurrentCulture);
    }

    public static bool IsValidNumber(this string number, CultureInfo culture)
    {
      return new Regex("^-?(?:\\d+|\\d{1,3}(?:" + culture.NumberFormat.NumberGroupSeparator + "\\d{3})+)?(?:\\" + culture.NumberFormat.NumberDecimalSeparator + "\\d+)?$", RegexOptions.ECMAScript).IsMatch(number);
    }

    public static IList<string> getPathParts(this string path)
    {
      return (IList<string>) Enumerable.ToList<string>((IEnumerable<string>) path.Split(new char[1]
      {
        Path.DirectorySeparatorChar
      }, StringSplitOptions.RemoveEmptyEntries));
    }

    public static string DirectoryPath(this string path)
    {
      return Path.GetDirectoryName(path);
    }

    public static IEnumerable<string> ReadLines(this string text)
    {
      StringReader reader = new StringReader(text);
      string line;
      while ((line = reader.ReadLine()) != null)
        yield return line;
    }

    public static void ReadLines(this string text, Action<string> callback)
    {
      StringReader stringReader = new StringReader(text);
      string str;
      while ((str = stringReader.ReadLine()) != null)
        callback(str);
    }

    public static string SplitCamelCase(this string str)
    {
      return Regex.Replace(Regex.Replace(str, "(\\P{Ll})(\\P{Ll}\\p{Ll})", "$1 $2"), "(\\p{Ll})(\\P{Ll})", "$1 $2");
    }

    public static string SplitPascalCase(this string str)
    {
      return StringExtensions.SplitCamelCase(str);
    }

    public static TEnum ToEnum<TEnum>(this string text) where TEnum : struct
    {
      Type enumType = typeof (TEnum);
      if (!enumType.IsEnum)
        throw new ArgumentException(StringExtensions.ToFormat("{0} is not an Enum", (object) enumType.Name));
      return (TEnum) Enum.Parse(enumType, text, true);
    }

    public static string FileEscape(this string file)
    {
      return StringExtensions.ToFormat("\"{0}\"", (object) file);
    }
  }
}
