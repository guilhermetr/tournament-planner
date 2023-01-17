using System.ComponentModel.DataAnnotations;

namespace TournamentPlannerAPI.Entities
{
    public class Tournament
    {
        public int Id { get; set; }
        [Required]
        [StringLength(30)]
        public string? Name { get; set; }
        public List<Game> Games { get; set; }
        public List<TournamentUser> TournamentUsers { get; set; }

        public Tournament()
        {
            Games = new List<Game>();
            TournamentUsers = new List<TournamentUser>();
        }
    }
}
