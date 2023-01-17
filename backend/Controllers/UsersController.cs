using TournamentPlannerAPI.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;

namespace TournamentPlannerAPI.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UsersController(AppDbContext context)
        {
            this._context = context;            
        }

        [HttpGet("{Id:int}")]
        public async Task<ActionResult<User>> GetUser(int Id)
        {
            var user = await _context.Users.FindAsync(Id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        [HttpGet]
        public async Task<ActionResult<List<User>>> GetUsers()
        {
            return await _context.Users.ToListAsync();            
        }

        [HttpPost]
        public async Task<ActionResult> PostUser([FromBody] User user)
        {            
            _context.Users.Add(user);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
