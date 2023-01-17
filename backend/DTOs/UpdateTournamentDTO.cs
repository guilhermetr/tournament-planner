namespace TournamentPlannerAPI.DTOs
{
    public class UpdateTournamentDTO
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public List<GameDTO> AddedGames { get; set; }
        public List<GameDTO> RemovedGames { get; set; }
        public List<UserDTO> AddedUsers { get; set; }
        public List<UserDTO> RemovedUsers { get; set; }

        public UpdateTournamentDTO()
        {
            AddedGames = new List<GameDTO>();
            RemovedGames = new List<GameDTO>();
            AddedUsers = new List<UserDTO>();
            RemovedUsers = new List<UserDTO>();
        }
    }
}
