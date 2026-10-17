using Microsoft.EntityFrameworkCore;
using RecipeOrganizer.Data.Models;

namespace RecipeOrganizer.Data.Data;

public class RecipeContext : DbContext
{
    public RecipeContext(DbContextOptions<RecipeContext> options)
        : base(options)
    {
    }

    public DbSet<Category> Categories { get; set; }

    public DbSet<Ingredient> Ingredients { get; set; }

    public DbSet<Recipe> Recipes { get; set; }

    public DbSet<RecipeIngredient> RecipeIngredients { get; set; }

    public DbSet<Favorite> Favorites { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<RecipeIngredient>()
            .Property(ri => ri.Quantity)
            .HasPrecision(8, 2);
    }
}