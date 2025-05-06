using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Models
{
    public class ShoppingList 
    { 
        public List<Ingredient> Ingredients { get; set; } = new List<Ingredient>();
    }
}
