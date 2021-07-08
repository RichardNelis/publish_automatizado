using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Interfaces
{
    public interface IApplicationServiceSistema
    {
        Task<ICollection<SistemaDTO>> FetchAllAsync();

        Task<SistemaDTO> GetByIdAsync(int id);

        Task<int> AddAsync(SistemaCreateDTO dto);

        Task UpdateAsync(SistemaCreateDTO dto);

        Task RemoveAsync(int Id);
    }
}