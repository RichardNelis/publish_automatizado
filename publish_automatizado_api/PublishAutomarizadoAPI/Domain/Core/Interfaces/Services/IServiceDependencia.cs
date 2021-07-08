using System.Threading.Tasks;
using PublishAutomarizadoAPI.Domain.Domain.Models;

namespace PublishAutomarizadoAPI.Domain.Core.Interfaces.Services
{
    public interface IServiceDependencia : IServiceBase<Dependencia>
    {
        Task RemoveAllBySistemaAsync(int IdSistema);

     }
}
