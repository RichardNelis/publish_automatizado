using Microsoft.AspNetCore.Mvc;
using PublishAutomarizadoAPI.Application.Interfaces;
using System;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PublishController : BaseController
    {
        private readonly IApplicationServicePublish _applicationService;

        public PublishController(IApplicationServicePublish ApplicationService)
        {
            _applicationService = ApplicationService;
        }

        [HttpPost]
        public async Task<IActionResult> Gerar(ChamadoDTO dto)
        {
            try
            {
                await _applicationService.GerarAsync(dto);

                MessageDTO message = new MessageDTO()
                {
                    Mensagem = "Publish concluído!"
                };

                return Ok(message);
            }
            catch (Exception ex)
            {
                return BadRequest("Erro ao gerar o publish!");
            }
        }
    }
}