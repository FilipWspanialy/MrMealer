using MrMealer.Views;

namespace MrMealer
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute("recipeDetails", typeof(RecipeDetailsPage));
            Routing.RegisterRoute("recipeEdit", typeof(RecipeEditPage));
            Routing.RegisterRoute("recipeAdd", typeof(RecipeAddPage));
            Routing.RegisterRoute("mainPage", typeof(MainPage));
            Routing.RegisterRoute("plan", typeof(PlanPage));
            Routing.RegisterRoute("day", typeof(DayPage));

        }
    }
}
