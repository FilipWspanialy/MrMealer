using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Models
{
    public class Meal
    {
        [Key]
        
        public int Id { get; set; }
        public string Name { get; set; }
        public List<Recipe>? Recipes { get; set; }
        public int DayId { get; set; }
        public Day Day { get; set; }


    }
}
