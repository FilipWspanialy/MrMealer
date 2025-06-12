using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Database.Models
{
    public class ApiMeal
    {
        [JsonProperty("idMeal")]
        public string IdMeal { get; set; }

        [JsonProperty("strMeal")]
        public string StrMeal { get; set; }

        [JsonProperty("strInstructions")]
        public string StrInstructions { get; set; }

        [JsonProperty("strMealThumb")]
        public string StrMealThumb { get; set; }

        [JsonExtensionData]
        public Dictionary<string, JToken> ExtraData { get; set; }

        public List<Ingredient> GetIngredients()
        {
            var ingredients = new List<Ingredient>();

            for (int i = 1; i <= 20; i++)
            {
                var ingredientKey = $"strIngredient{i}";
                var measureKey = $"strMeasure{i}";

                var ingredientValue = ExtraData.ContainsKey(ingredientKey) ? ExtraData[ingredientKey]?.ToString() : null;
                var measureValue = ExtraData.ContainsKey(measureKey) ? ExtraData[measureKey]?.ToString() : null;

                if (!string.IsNullOrWhiteSpace(ingredientValue))
                {
                    ingredients.Add(new Ingredient
                    {
                        Name = ingredientValue,
                        Measure = measureValue
                    });
                }
            }

            return ingredients;
        }
    }
}
