namespace RecipeOrganizer.Data.Models;

public class Recipe
{
    public int RecipeId { get; set; }

    public string Name { get; set; } = "";

    public string Instructions { get; set; } = "";

    public int PrepTimeMinutes { get; set; }

    public int Servings { get; set; }

    public int CategoryId { get; set; }

    public Category? Category { get; set; }
}