using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.Models
{
    public class Day
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public List<Meal>? Meals { get; set; }
        public DateTime? Date { get; set; }
    }
}
