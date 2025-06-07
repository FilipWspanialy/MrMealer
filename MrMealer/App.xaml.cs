
using Microsoft.EntityFrameworkCore;
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
            MainPage = new AppShell();
            LoadRecipes();
        }

        private async void LoadRecipes()
        {
            await ApiService.GetAsync("chicken");
        }
    }
}
