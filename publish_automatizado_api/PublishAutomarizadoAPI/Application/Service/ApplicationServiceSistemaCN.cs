using PublishAutomarizadoAPI.Application.Interfaces;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Service
{
    public class ApplicationServiceSistemaCN : IApplicationServiceSistemaCN, IDisposable
    {
        private readonly IMapperSistemaCN _mapper;

        private readonly IServiceSistemaCN _service;

        public ApplicationServiceSistemaCN(IServiceSistemaCN Service, IMapperSistemaCN Mapper)
        {
            _service = Service;
            _mapper = Mapper;
        }

        public async Task AddAsync(SistemaCNDTO dto)
        {
            var obj = _mapper.MapperToEntity(dto);
            await _service.AddAsync(obj);
            dto.IdCodigo = obj.IdCodigo;
        }

        public async Task UpdateAsync(SistemaCNDTO dto)
        {
            var obj = _mapper.MapperToEntity(dto);
            await _service.UpdateAsync(obj);
        }

        public async Task<ICollection<SistemaCNDTO>> FetchAllAsync()
        {
            var obj = await _service.FetchAllAsync();
            return _mapper.MapperToListDTO(obj);
        }

        public async Task<SistemaCNDTO> GetByIdAsync(int Id)
        {
            var obj = await _service.GetByIdAsync(Id);
            return _mapper.MapperToDTO(obj);
        }

        public async Task RemoveAsync(int Id)
        {
            var obj = await _service.GetByIdAsync(Id);
            await _service.RemoveAsync(obj);
        }

        public void Dispose()
        {
            _service.Dispose();
        }
    }
}
