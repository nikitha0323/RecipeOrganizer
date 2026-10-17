using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using RecipeOrganizer.Data.Data;
using RecipeOrganizer.Data.Models;

namespace WebApplication.Pages_RecipeIngredients
{
    public class CreateModel : PageModel
    {
        private readonly RecipeOrganizer.Data.Data.RecipeContext _context;

        public CreateModel(RecipeOrganizer.Data.Data.RecipeContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["IngredientId"] = new SelectList(_context.Ingredients, "IngredientId", "Name");
        ViewData["RecipeId"] = new SelectList(_context.Recipes, "RecipeId", "Instructions");
            return Page();
        }

        [BindProperty]
        public RecipeIngredient RecipeIngredient { get; set; } = default!;

        // To protect from overposting attacks, see https://aka.ms/RazorPagesCRUD
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.RecipeIngredients.Add(RecipeIngredient);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}
