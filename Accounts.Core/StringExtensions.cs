using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading;

namespace Accounts.Core
{
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