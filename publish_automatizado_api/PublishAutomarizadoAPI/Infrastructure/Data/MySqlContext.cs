using Microsoft.EntityFrameworkCore;
using PublishAutomarizadoAPI.Domain.Domain.Models;
using System;
using System.Threading.Tasks;

public class MySqlContext : DbContext
{
    public MySqlContext() { }

    public MySqlContext(DbContextOptions<MySqlContext> options) : base(options) { }

    public DbSet<Sistema> Sistemas { get; set; }
    public DbSet<SistemaCN> SistemaCNs { get; set; }
    public DbSet<Dependencia> Dependencias { get; set; }

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
