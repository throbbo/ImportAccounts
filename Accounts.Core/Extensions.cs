using Newtonsoft.Json;

namespace Accounts.Core
{
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
}