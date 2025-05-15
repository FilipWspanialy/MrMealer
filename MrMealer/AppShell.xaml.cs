using MrMealer.Views;

namespace MrMealer
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute("recipeDetails", typeof(RecipeDetailsPage));

        }
    }
}
