
using MrMealer.Database;
using MrMealer.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace MrMealer
{
    public partial class App : Application
    {
        public App(AppDbContext db)
        {
            InitializeComponent();
            db.Database.EnsureCreated();
            MainPage = new AppShell();
            LoadRecipes();
        }

        private async void LoadRecipes()
        {
            var recipes = await ApiService.GetRecipesAsync("chicken");
            var ingres = await ApiService.GetIngreAsync();
        }
    }
}
