using MrMealer.Database;

namespace MrMealer
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();

            _ = InitializeDatabaseIfNeeded();
        }
        private async Task InitializeDatabaseIfNeeded()
        {
            bool isInitialized = Preferences.Get("IsDatabaseInitialized", false);
            if (isInitialized)
                return;

            var db = new AppDbContext();

            var apiRecipes = await ApiService.GetRecipesAsync("chicken");
            foreach (var recipe in apiRecipes)
            {
                recipe.IsUserCreated = false;
                await db.AddAsync(recipe);
            }

            Preferences.Set("IsDatabaseInitialized", true); 
        }

    }
}
