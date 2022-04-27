using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Interfaces
{
    public interface IApplicationServiceDependencia
    {
        Task AddAsync(int IdSistema, int IdSistemaCN);

        Task UpdateAsync(DependenciaDTO dto);

        Task RemoveAsync(int Id);

        Task RemoveAllBySistemaAsync(int IdSistema);
    }
}