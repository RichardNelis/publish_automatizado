using PublishAutomarizadoAPI.Domain.Domain.Models;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces;
using System.Collections.Generic;

namespace PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Map
{
    public class MapperSistema : IMapperSistema
    {
        private readonly IMapperDependencia _mapperDependencia;

        public MapperSistema(IMapperDependencia mapperDependencia)
        {
            _mapperDependencia = mapperDependencia;
        }

        public SistemaDTO MapperToDTO(Sistema obj)
        {
            SistemaDTO dto = new SistemaDTO
            {
                IdCodigo = obj.IdCodigo,
                NomeSistema = obj.NomeSistema,
                CaminhoSistema = obj.CaminhoSistema,
                Dependencia = obj.Dependencia == null ? null : _mapperDependencia.MapperToEntity(obj.Dependencia),
            };

            return dto;
        }

        public Sistema MapperToEntity(SistemaDTO dto)
        {
            Sistema obj = new Sistema
            {
                IdCodigo = dto.IdCodigo,
                NomeSistema = dto.NomeSistema,
                CaminhoSistema = dto.CaminhoSistema,
            };

            return obj;
        }

        public Sistema MapperToEntity(SistemaCreateDTO dto)
        {
            Sistema obj = new Sistema
            {
                IdCodigo = dto.IdCodigo,
                NomeSistema = dto.NomeSistema,
                CaminhoSistema = dto.CaminhoSistema,
            };

            return obj;
        }

        public ICollection<SistemaDTO> MapperToListDTO(ICollection<Sistema> objs)
        {
            List<SistemaDTO> _sistemaDTOS = new List<SistemaDTO>();

            foreach (var obj in objs)
            {
                SistemaDTO sistemaDTO = new SistemaDTO
                {
                    IdCodigo = obj.IdCodigo,
                    NomeSistema = obj.NomeSistema,
                    CaminhoSistema = obj.CaminhoSistema,
                    Dependencia = obj.Dependencia == null ? null : _mapperDependencia.MapperToEntity(obj.Dependencia),
                };

                _sistemaDTOS.Add(sistemaDTO);
            }

            return _sistemaDTOS;
        }
    }
}