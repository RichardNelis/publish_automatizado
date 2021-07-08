using System.Threading.Tasks;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using PublishAutomarizadoAPI.Domain.Domain.Models;

namespace PublishAutomarizadoAPI.Domain.Services
{
    public class ServiceDependencia : ServiceBase<Dependencia>, IServiceDependencia
    {
        private readonly IRepositoryDependencia _repository;

        public ServiceDependencia(IRepositoryDependencia Repository)
            : base(Repository)
        {
            _repository = Repository;
        }

        public async Task RemoveAllBySistemaAsync(int IdSistema)
        {
            await _repository.RemoveAllBySistemaAsync(IdSistema);
        }
    }
}
