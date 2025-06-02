using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Models
{
    public class ApiResponseIngre
    {
        [JsonProperty("meals")]
        public List<ApiIngre> Meals { get; set; }
    }
}
