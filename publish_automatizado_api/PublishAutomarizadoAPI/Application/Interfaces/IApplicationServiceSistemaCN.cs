using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Interfaces
{
    public interface IApplicationServiceSistemaCN
    {
        Task<ICollection<SistemaCNDTO>> FetchAllAsync();

        Task<SistemaCNDTO> GetByIdAsync(int id);

        Task AddAsync(SistemaCNDTO dto);

        Task UpdateAsync(SistemaCNDTO dto);

        Task RemoveAsync(int Id);
    }
}