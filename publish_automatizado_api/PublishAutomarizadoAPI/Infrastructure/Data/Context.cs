using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using PublishAutomarizadoAPI.Domain.Domain.Models;
using System;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Infrastructure.Data
{
    public class Context : DbContext
    {
        public DbSet<Sistema> Sistemas { get; set; }
        public DbSet<SistemaCN> SistemaCNs { get; set; }
        public DbSet<Dependencia> Dependencias { get; set; }

        public Context(DbContextOptions<Context> options) : base(options) { }

        public async Task<int> SaveChangesAsync()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.State == EntityState.Added)
                {
                    entry.Property("DataInclusao").CurrentValue = DateTime.Now;
                }

                if (entry.State == EntityState.Modified)
                {
                    entry.Property("DataAlteracao").IsModified = true;
                    entry.Property("DataAlteracao").CurrentValue = DateTime.Now;
                }
            }

            return await base.SaveChangesAsync();
        }
    }
}
