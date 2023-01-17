using System.ComponentModel.DataAnnotations;

namespace TournamentPlannerAPI.Entities
{
    public class Game
    {
        public int Id { get; set; }
        [Required]
        public string? Name { get; set; }       
    }
}
