using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Database.Models
{
    public class Recipe
    {
        [Key]
        public int Id { get; set; }

        public string Name { get; set; }
        public string Instructions { get; set; }
        public string? ImageUrl { get; set; }

        public bool IsUserCreated { get; set; } = false;

        public List<Ingredient> Ingredients { get; set; } = new();
    }
}
