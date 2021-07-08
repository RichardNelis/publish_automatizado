using PublishAutomarizadoAPI.Domain.Domain.Models;
using System.Collections.Generic;

namespace PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces
{
    public interface IMapperSistemaCN
    {
        SistemaCNDTO MapperToDTO(SistemaCN obj);

        SistemaCN MapperToEntity(SistemaCNDTO dto);        

        ICollection<SistemaCNDTO> MapperToListDTO(ICollection<SistemaCN> objs);
    }
}
