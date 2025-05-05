using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Models
{
    public class Ingredient
    {
        [Key]
        public int Id { get; set; }

        public string Name { get; set; }
        public string Measure { get; set; }

        public string RecipeId { get; set; }
        public Recipe Recipe { get; set; }
    }

}
