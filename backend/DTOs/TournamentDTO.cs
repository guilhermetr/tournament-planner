namespace TournamentPlannerAPI.DTOs
{
    public class TournamentDTO
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public List<GameDTO> Games { get; set; }
        public List<UserDTO> Users { get; set; }

        public TournamentDTO()
        {
            Games = new List<GameDTO>();
            Users = new List<UserDTO>();
        }
    }
}
