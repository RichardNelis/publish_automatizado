using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys
{
    public interface IRepositoryBase<T> where T : class
    {
        Task AddAsync(T obj);

        Task<T> GetByIdAsync(int id);

        Task<ICollection<T>> FetchAll();

        Task UpdateAsync(T obj);

        Task RemoveAsync(T obj);

        void Dispose();
    }
}