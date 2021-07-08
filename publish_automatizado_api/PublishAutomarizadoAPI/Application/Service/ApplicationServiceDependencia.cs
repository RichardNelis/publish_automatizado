using PublishAutomarizadoAPI.Application.Interfaces;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Service
{
    public class ApplicationServiceDependencia : IApplicationServiceDependencia, IDisposable
    {
        private readonly IMapperDependencia _mapper;

        private readonly IServiceDependencia _service;

        public ApplicationServiceDependencia(IServiceDependencia Service, IMapperDependencia Mapper)
        {
            _service = Service;
            _mapper = Mapper;
        }

        public async Task AddAsync(int IdSistema, int IdSistemaCN)
        {
            var obj = _mapper.MapperToEntity(IdSistema, IdSistemaCN);
            await _service.AddAsync(obj);
        }

        public async Task RemoveAsync(int Id)
        {
            var obj = await _service.GetByIdAsync(Id);
            await _service.RemoveAsync(obj);
        }

        public async Task RemoveAllBySistemaAsync(int IdSistema)
        {            
            await _service.RemoveAllBySistemaAsync(IdSistema);
        }

        public void Dispose()
        {
            _service.Dispose();
        }

        public Task UpdateAsync(DependenciaDTO dto)
        {
            /*var obj = _mapper.MapperToEntity(dto);
            await _service.UpdateAsync(obj);*/

            throw new NotImplementedException();
        }
    }
}
