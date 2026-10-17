using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace RecipeOrganizer.Data.Data;

public class RecipeContextFactory : IDesignTimeDbContextFactory<RecipeContext>
{
    public RecipeContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<RecipeContext>();

        optionsBuilder.UseSqlServer(
            "Server=(localdb)\\mssqllocaldb;Database=RecipeOrganizerDb;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True");

        return new RecipeContext(optionsBuilder.Options);
    }
}