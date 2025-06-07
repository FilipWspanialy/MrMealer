using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using MrMealer.Models;
namespace MrMealer.Models
{

    public class ApiIngre
    {
        [JsonProperty("strIngredient")]
        public string StrIngredient { get; set; }
    }
}
