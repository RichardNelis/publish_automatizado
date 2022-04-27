using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Domain.Models;
using PublishAutomarizadoAPI.Infrastructure.Data;

namespace PublishAutomarizadoAPI.Repository
{
    public class RepositorySistemaCN : RepositoryBase<SistemaCN>, IRepositorySistemaCN
    {
        private readonly Context _context;

        public RepositorySistemaCN(Context Context) : base(Context)
        {
            _context = Context;
        }
    }
}
