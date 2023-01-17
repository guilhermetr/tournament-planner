namespace TournamentPlannerAPI.Entities
{
    public class TournamentUser
    {
        public int Id { get; set; }
        public int TournamentId { get; set; }
        public Tournament Tournament { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
    }
}
