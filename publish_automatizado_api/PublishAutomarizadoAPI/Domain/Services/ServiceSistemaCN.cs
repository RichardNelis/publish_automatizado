using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using PublishAutomarizadoAPI.Domain.Domain.Models;

namespace PublishAutomarizadoAPI.Domain.Services
{
    public class ServiceSistemaCN : ServiceBase<SistemaCN>, IServiceSistemaCN
    {
        private readonly IRepositorySistemaCN _repository;

        public ServiceSistemaCN(IRepositorySistemaCN Repository)
            : base(Repository)
        {
            _repository = Repository;
        }
    }
}
