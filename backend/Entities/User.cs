using System.ComponentModel.DataAnnotations;

namespace TournamentPlannerAPI.Entities
{
    public class User
    {
        public int Id { get; set; }
        [Required]
        [StringLength(12)]
        public string? Username { get; set; }
        public List<TournamentUser> TournamentUsers { get; set; }

        public User()
        {
            TournamentUsers = new List<TournamentUser>();
        }
    }
}
