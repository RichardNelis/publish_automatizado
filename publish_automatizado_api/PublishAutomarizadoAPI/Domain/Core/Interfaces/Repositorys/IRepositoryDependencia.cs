using PublishAutomarizadoAPI.Domain.Domain.Models;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys
{
    public interface IRepositoryDependencia : IRepositoryBase<Dependencia>
    {
        Task RemoveAllBySistemaAsync(int IdSistema);
    }
}