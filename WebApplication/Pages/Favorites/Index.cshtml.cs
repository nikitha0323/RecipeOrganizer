using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using RecipeOrganizer.Data.Data;
using RecipeOrganizer.Data.Models;

namespace WebApplication.Pages_Favorites
{
    public class IndexModel : PageModel
    {
        private readonly RecipeOrganizer.Data.Data.RecipeContext _context;

        public IndexModel(RecipeOrganizer.Data.Data.RecipeContext context)
        {
            _context = context;
        }

        public IList<Favorite> Favorite { get;set; } = default!;

        public async Task OnGetAsync()
        {
            Favorite = await _context.Favorites
                .Include(f => f.Recipe).ToListAsync();
        }
    }
}
