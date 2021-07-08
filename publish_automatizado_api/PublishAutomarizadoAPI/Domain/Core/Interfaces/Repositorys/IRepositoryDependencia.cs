using System.Threading.Tasks;
using PublishAutomarizadoAPI.Domain.Domain.Models;

namespace PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys
{
    public interface IRepositoryDependencia : IRepositoryBase<Dependencia>
    {
        Task RemoveAllBySistemaAsync(int IdSistema);
    }
}