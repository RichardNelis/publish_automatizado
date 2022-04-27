using PublishAutomarizadoAPI.Domain.Domain.Models;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Domain.Core.Interfaces.Services
{
    public interface IServiceDependencia : IServiceBase<Dependencia>
    {
        Task RemoveAllBySistemaAsync(int IdSistema);

    }
}
