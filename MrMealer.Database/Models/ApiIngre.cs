using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Database.Models
{
    public class ApiIngre
    {
        [JsonProperty("strIngredient")]
        public string StrIngredient { get; set; }
    }
}
