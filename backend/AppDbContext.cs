using TournamentPlannerAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace TournamentPlannerAPI
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TournamentUser>()
                .HasOne(tu => tu.Tournament)
                .WithMany(tu => tu.TournamentUsers)
                .HasForeignKey(tu => tu.TournamentId);

            modelBuilder.Entity<TournamentUser>()
                .HasOne(tu => tu.User)
                .WithMany(tu => tu.TournamentUsers)
                .HasForeignKey(tu => tu.UserId);
        }
        public DbSet<User> Users { get; set; }
        public DbSet<Game> Games { get; set; }
        public DbSet<Tournament> Tournaments { get; set; }
        public DbSet<TournamentUser> TournamentUsers { get; set; }
    }
}
