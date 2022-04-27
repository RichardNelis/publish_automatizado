using PublishAutomarizadoAPI.Domain.Domain.Models;

namespace PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces
{
    public interface IMapperDependencia
    {
        //ICollection<DependenciaDTO> MapperToListDTO(ICollection<Dependencia> objs);

        Dependencia MapperToEntity(int IdSistema, int IdSistemaCN);

        DependenciaDTO MapperToEntity(Dependencia obj);
    }
}
