
using Microsoft.EntityFrameworkCore;
using MrMealer.Database;
using MrMealer.Database.Models;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace MrMealer
{
    public partial class App : Application
    {
        public App(AppDbContext db)
        {
            InitializeComponent();
            MainPage = new Views.LoadingPage();
            LoadRecipes();
        }

        private async void LoadRecipes()
        {
            await ApiService.GetAsync("chicken");
        }
    }
}
