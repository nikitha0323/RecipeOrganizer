using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using RecipeOrganizer.Data.Data;
using RecipeOrganizer.Data.Models;

namespace WebApplication.Pages_RecipeIngredients
{
    public class DetailsModel : PageModel
    {
        private readonly RecipeOrganizer.Data.Data.RecipeContext _context;

        public DetailsModel(RecipeOrganizer.Data.Data.RecipeContext context)
        {
            _context = context;
        }

        public RecipeIngredient RecipeIngredient { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var recipeingredient = await _context.RecipeIngredients.FirstOrDefaultAsync(m => m.RecipeIngredientId == id);
            if (recipeingredient == null)
            {
                return NotFound();
            }
            else
            {
                RecipeIngredient = recipeingredient;
            }
            return Page();
        }
    }
}
