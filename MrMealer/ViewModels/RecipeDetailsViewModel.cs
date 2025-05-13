using MrMealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MrMealer.ViewModels
{
    public class RecipeDetailsViewModel
    {
        public Recipe recipe { get; set; } = new Recipe();

        public RecipeDetailsViewModel()
        {
            LoadRecipe();
        }

        private async void LoadRecipe()
        {
        }
    }
}
