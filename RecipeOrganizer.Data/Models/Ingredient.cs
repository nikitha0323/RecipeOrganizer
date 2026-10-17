namespace RecipeOrganizer.Data.Models;

public class Ingredient
{
    public int IngredientId { get; set; }

    public string Name { get; set; } = "";

    public string? DefaultUnit { get; set; }
}