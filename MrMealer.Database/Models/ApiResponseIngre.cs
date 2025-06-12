using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace MrMealer.Database.Models
{
    public class ApiResponseIngre
    {
        [JsonProperty("meals")]
        public List<ApiIngre> Meals { get; set; }
    }
}
