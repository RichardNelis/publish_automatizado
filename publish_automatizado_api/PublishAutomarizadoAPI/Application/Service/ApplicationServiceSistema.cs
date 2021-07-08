using PublishAutomarizadoAPI.Application.Interfaces;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Map;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Service
{
    public class ApplicationServiceSistema : IApplicationServiceSistema, IDisposable
    {
        private readonly IMapperSistema _mapper;

        private readonly IServiceSistema _service;

        private readonly IMapperDependencia _mapperDependencia;

        private readonly IServiceDependencia _serviceDependencia;

        public ApplicationServiceSistema(IMapperSistema mapper, IServiceSistema service, IMapperDependencia mapperDependencia, IServiceDependencia serviceDependencia)
        {
            _mapper = mapper;
            _service = service;
            _mapperDependencia = mapperDependencia;
            _serviceDependencia = serviceDependencia;
        }

        public async Task<int> AddAsync(SistemaCreateDTO dto)
        {
            var obj = _mapper.MapperToEntity(dto);

            ApplicationServiceDependencia applicationServiceDependencia = new ApplicationServiceDependencia(_serviceDependencia, _mapperDependencia);

            await _service.AddAsync(obj);

            foreach (var item in dto.Dependencias)
            {
                await applicationServiceDependencia.AddAsync(obj.IdCodigo, item);
            }

            return obj.IdCodigo;
        }

        public async Task UpdateAsync(SistemaCreateDTO dto)
        {
            ApplicationServiceDependencia applicationServiceDependencia = new ApplicationServiceDependencia(_serviceDependencia, _mapperDependencia);
            await applicationServiceDependencia.RemoveAllBySistemaAsync(dto.IdCodigo);

            foreach (var item in dto.Dependencias)
            {
                await applicationServiceDependencia.AddAsync(dto.IdCodigo, item);
            }

            var obj = _mapper.MapperToEntity(dto);
            await _service.UpdateAsync(obj);
        }

        public async Task<ICollection<SistemaDTO>> FetchAllAsync()
        {
            var obj = await _service.FetchAllAsync();
            return _mapper.MapperToListDTO(obj);
        }

        public async Task<SistemaDTO> GetByIdAsync(int Id)
        {
            var obj = await _service.GetByIdAsync(Id);
            return _mapper.MapperToDTO(obj);
        }

        public async Task RemoveAsync(int Id)
        {
            ApplicationServiceDependencia applicationServiceDependencia = new ApplicationServiceDependencia(_serviceDependencia, _mapperDependencia);
            await applicationServiceDependencia.RemoveAllBySistemaAsync(Id);

            var obj = await _service.GetByIdAsync(Id);
            await _service.RemoveAsync(obj);
        }

        public void Dispose()
        {
            _service.Dispose();
        }
    }
}
