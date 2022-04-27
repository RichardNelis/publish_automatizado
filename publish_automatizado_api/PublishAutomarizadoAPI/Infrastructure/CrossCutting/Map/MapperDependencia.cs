using PublishAutomarizadoAPI.Domain.Domain.Models;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces;

namespace PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Map
{
    public class MapperDependencia : IMapperDependencia
    {
        private readonly IMapperSistemaCN _mapperSistemaCN;

        public MapperDependencia(IMapperSistemaCN mapperSistemaCN)
        {
            _mapperSistemaCN = mapperSistemaCN;
        }

        public Dependencia MapperToEntity(int IdSistema, int IdSistemaCN)
        {
            Dependencia dependencia = new Dependencia
            {
                EsSistema = IdSistema,
                EsSistemaCN = IdSistemaCN
            };

            return dependencia;
        }

        public DependenciaDTO MapperToEntity(Dependencia obj)
        {
            DependenciaDTO dependencia = new DependenciaDTO
            {
                SistemaCNDTOs = obj.SistemaCNs == null ? null : _mapperSistemaCN.MapperToListDTO(obj.SistemaCNs),
            };

            return dependencia;
        }

        /*public ICollection<DependenciaDTO> MapperToListDTO(ICollection<Dependencia> objs)
        {
            List<DependenciaDTO> _DependenciaDTOS = new List<DependenciaDTO>();

            foreach (var obj in objs)
            {
                DependenciaDTO DependenciaDTO = new DependenciaDTO
                {
                    SistemaCNDTOs = obj.SistemaCNs == null ? null : _mapperSistemaCN.MapperToListDTO(obj.SistemaCNs),
                };

                _DependenciaDTOS.Add(DependenciaDTO);
            }

            return _DependenciaDTOS;
        }*/
    }
}