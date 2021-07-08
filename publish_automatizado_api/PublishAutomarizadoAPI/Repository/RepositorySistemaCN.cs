using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Domain.Models;

public class RepositorySistemaCN : RepositoryBase<SistemaCN>, IRepositorySistemaCN
{
    private readonly MySqlContext _context;

    public RepositorySistemaCN(MySqlContext Context) : base(Context)
    {
        _context = Context;
    }
}
