using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Application.Interfaces
{
    public interface IApplicationServicePublish
    {
        Task GerarAsync(ChamadoDTO dto);
    }
}