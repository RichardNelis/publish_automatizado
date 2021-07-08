using PublishAutomarizadoAPI.Domain.Domain.Models;
using System.Collections.Generic;

namespace PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces
{
    public interface IMapperSistema
    {
        SistemaDTO MapperToDTO(Sistema obj);

        Sistema MapperToEntity(SistemaDTO dto);

        Sistema MapperToEntity(SistemaCreateDTO dto);

        ICollection<SistemaDTO> MapperToListDTO(ICollection<Sistema> objs);
    }
}
