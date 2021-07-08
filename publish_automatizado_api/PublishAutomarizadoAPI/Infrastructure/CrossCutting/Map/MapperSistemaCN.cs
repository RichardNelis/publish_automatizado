using PublishAutomarizadoAPI.Domain.Domain.Models;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces;
using System.Collections.Generic;

namespace PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Map
{
    public class MapperSistemaCN : IMapperSistemaCN
    {
        public SistemaCNDTO MapperToDTO(SistemaCN obj)
        {
            SistemaCNDTO dto = new SistemaCNDTO
            {
                IdCodigo = obj.IdCodigo,
                NomeSistema = obj.NomeSistema,
                CaminhoSistemaCN = obj.CaminhoSistemaCN,
            };

            return dto;
        }

        public SistemaCN MapperToEntity(SistemaCNDTO dto)
        {
            SistemaCN obj = new SistemaCN
            {
                IdCodigo = dto.IdCodigo,
                NomeSistema = dto.NomeSistema,
                CaminhoSistemaCN = dto.CaminhoSistemaCN,
            };

            return obj;
        }

        public ICollection<SistemaCNDTO> MapperToListDTO(ICollection<SistemaCN> objs)
        {
            List<SistemaCNDTO> _SistemaCNDTOS = new List<SistemaCNDTO>();

            foreach (var obj in objs)
            {
                SistemaCNDTO dto = new SistemaCNDTO
                {
                    IdCodigo = obj.IdCodigo,
                    NomeSistema = obj.NomeSistema,
                    CaminhoSistemaCN = obj.CaminhoSistemaCN,
                };

                _SistemaCNDTOS.Add(dto);
            }

            return _SistemaCNDTOS;
        }
    }
}