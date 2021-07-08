using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using PublishAutomarizadoAPI.Domain.Domain.Models;

namespace PublishAutomarizadoAPI.Domain.Services
{
    public class ServiceSistema : ServiceBase<Sistema>, IServiceSistema
    {
        private readonly IRepositorySistema _repository;

        public ServiceSistema(IRepositorySistema Repository)
            : base(Repository)
        {
            _repository = Repository;
        }
    }
}
