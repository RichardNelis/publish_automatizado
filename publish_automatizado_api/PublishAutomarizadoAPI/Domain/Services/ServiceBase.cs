using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Domain.Services
{
    public abstract class ServiceBase<T> : IDisposable, IServiceBase<T> where T : class
    {
        private readonly IRepositoryBase<T> _repository;

        public ServiceBase(IRepositoryBase<T> Repository)
        {
            _repository = Repository;
        }

        public virtual async Task AddAsync(T obj)
        {
            await _repository.AddAsync(obj);
        }

        public virtual async Task<ICollection<T>> FetchAllAsync()
        {
            return await _repository.FetchAll();
        }

        public virtual async Task<T> GetByIdAsync(int id)
        {
            return await _repository.GetByIdAsync(id);
        }

        public virtual async Task RemoveAsync(T obj)
        {
            await _repository.RemoveAsync(obj);
        }

        public virtual async Task UpdateAsync(T obj)
        {
            await _repository.UpdateAsync(obj);
        }

        public virtual void Dispose()
        {
            _repository.Dispose();
        }
    }
}