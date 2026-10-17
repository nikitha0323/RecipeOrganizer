namespace RecipeOrganizer.Data.Models;

public class Favorite
{
    public int FavoriteId { get; set; }

    public string UserName { get; set; } = "";

    public int RecipeId { get; set; }

    public Recipe? Recipe { get; set; }
}