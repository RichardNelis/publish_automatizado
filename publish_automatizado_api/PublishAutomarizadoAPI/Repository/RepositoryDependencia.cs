using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Domain.Models;

public class RepositoryDependencia : RepositoryBase<Dependencia>, IRepositoryDependencia
{
    private readonly MySqlContext _context;

    public RepositoryDependencia(MySqlContext Context) : base(Context)
    {
        _context = Context;
    }

    public async Task RemoveAllBySistemaAsync(int IdSistema)
    {
        try
        {
            List<Dependencia> dependencias = _context.Set<Dependencia>().Where(x => x.EsSistema == IdSistema).ToList();

            foreach (var dependencia in dependencias)
            {
                _context.Set<Dependencia>().Remove(dependencia);
            }
            
            await _context.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
