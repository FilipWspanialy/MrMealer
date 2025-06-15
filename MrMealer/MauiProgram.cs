using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using MrMealer.Database;

namespace MrMealer
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });
            builder.Services.AddDbContext<AppDbContext>();
            builder.Services.AddTransient<RecipesViewModel>();


#if DEBUG
            builder.Logging.AddDebug();
#endif

            var app = builder.Build();

            // Wymuszamy migrację bazy przy starcie
            using (var scope = app.Services.CreateScope())
            {
                var db = scope.ServiceProvider.GetRequiredService<AppDbContext>();
                db.Database.Migrate();  // <-- tutaj stosujemy migracje
            }

            return app;
        }
    }
}
