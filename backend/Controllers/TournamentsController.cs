using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using TournamentPlannerAPI.DTOs;
using TournamentPlannerAPI.Entities;

namespace TournamentPlannerAPI.Controllers
{
    [Route("api/tournaments")]
    [ApiController]
    public class TournamentsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public TournamentsController(AppDbContext context)
        {
            this._context = context;
        }

        [HttpPost]
        public async Task<ActionResult> PostTournament([FromBody] TournamentDTO tournamentDTO)
        {
            var tournament = new Tournament
            {
                Name = tournamentDTO.Name
            };
            _context.Tournaments.Add(tournament);
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpPut]
        public async Task<ActionResult> PutTournament([FromBody] UpdateTournamentDTO tournamentDTO)
        {
            var tournament = await _context.Tournaments
                .Include(t => t.Games)
                .FirstOrDefaultAsync(t => t.Id == tournamentDTO.Id);                
            if (tournament == null)
            {
                return NotFound();
            }

            // Remove old games
            var removedGamesIds = tournamentDTO.RemovedGames.Select(game => game.Id);
            var removedGames = await _context.Games
                .Where(g => removedGamesIds.Contains(g.Id))
                .ToListAsync();
            _context.Games.RemoveRange(removedGames);

            // Add new games
            tournamentDTO.AddedGames.ForEach(gameDTO =>
            {
                tournament.Games.Add(new Game
                {
                    Name = gameDTO.Name,
                });
            });

            // Remove old users
            var removedUsersIds = tournamentDTO.RemovedUsers.Select(user => user.Id);
            var removedUsers = await _context.TournamentUsers
                .Where(tu => removedUsersIds.Contains(tu.UserId))
                .ToListAsync();
            _context.TournamentUsers.RemoveRange(removedUsers);

            // Add new users            
            foreach (UserDTO userDTO in tournamentDTO.AddedUsers)
            {
                var user = await _context.Users.FindAsync(userDTO.Id);
                if (user == null)
                {
                    return NotFound($"User with Id {userDTO.Id} not found");
                }
                
                tournament.TournamentUsers.Add(new TournamentUser
                {
                    TournamentId = tournament.Id,
                    Tournament = tournament,
                    UserId = user.Id,
                    User = user,
                });
            }

            _context.Tournaments.Update(tournament);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
