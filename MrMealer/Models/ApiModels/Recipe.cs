using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Models
{
    public class Recipe
    {

        public string IdMeal { get; set; }
        public string StrMeal { get; set; }
        public string StrInstructions { get; set; }
        public string StrMealThumb { get; set; }
    }
}
