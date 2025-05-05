using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Models
{
    public class ApiResponse
    {
        [JsonProperty("meals")]
        public List<ApiMeal> Meals { get; set; }
    }
}
