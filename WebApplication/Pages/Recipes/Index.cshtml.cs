using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using RecipeOrganizer.Data.Data;
using RecipeOrganizer.Data.Models;

namespace WebApplication.Pages_Recipes;
public class IndexModel : PageModel
{
    private readonly RecipeContext _context;

    public IndexModel(RecipeContext context)
    {
        _context = context;
    }

    public IList<Recipe> Recipe { get; set; } = new List<Recipe>();

    [BindProperty(SupportsGet = true)]
    public string? SearchTerm { get; set; }

    public async Task OnGetAsync()
    {
        var recipes = _context.Recipes
            .Include(r => r.Category)
            .AsQueryable();

        if (!string.IsNullOrWhiteSpace(SearchTerm))
        {
            recipes = recipes.Where(r =>
                r.Name.Contains(SearchTerm) ||
                (r.Category != null && r.Category.Name.Contains(SearchTerm)));
        }

        Recipe = await recipes.ToListAsync();
    }
}