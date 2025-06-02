using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace MrMealer.Models
{
    public class IngredientFromApi
    {

        [Key]
        public int Id { get; set; }

        public string Name { get; set; }
    }

}
