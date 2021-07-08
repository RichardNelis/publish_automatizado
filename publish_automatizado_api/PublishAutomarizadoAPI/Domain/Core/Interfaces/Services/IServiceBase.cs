using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Domain.Core.Interfaces.Services
{
    public interface IServiceBase<T> where T : class
    {
        Task AddAsync(T obj);

        Task<ICollection<T>> FetchAllAsync();

        Task<T> GetByIdAsync(int id);

        Task UpdateAsync(T obj);

        Task RemoveAsync(T obj);

        void Dispose();
    }
}
