using Microsoft.AspNetCore.Mvc;
using PublishAutomarizadoAPI.Application.Interfaces;
using System;
using System.Threading.Tasks;

namespace PublishAutomarizadoAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SistemaController : BaseController
    {
        private readonly IApplicationServiceSistema _applicationService;

        public SistemaController(IApplicationServiceSistema ApplicationService)
        {
            _applicationService = ApplicationService;
        }

        [HttpGet]
        public async Task<IActionResult> FetchAll()
        {
            return Ok(await _applicationService.FetchAllAsync());
        }

        [HttpGet("{Id}"), Route("[controller]"), ActionName("GetAsync")]
        public async Task<IActionResult> GetAsync(int Id)
        {
            return Ok(await _applicationService.GetByIdAsync(Id));
        }

        [HttpPost]
        public async Task<IActionResult> Post(SistemaCreateDTO dto)
        {
            try
            {
                if (dto == null)
                {
                    throw new ArgumentException();
                }

                int idSistema = await _applicationService.AddAsync(dto);

                return CreatedAtAction(nameof(GetAsync), new { idSistema }, dto);
            }
            catch (Exception ex)
            {
                return BadRequest("Erro ao tentar salvar os dados");
            }
        }

        [HttpPut]
        public async Task<IActionResult> Put(SistemaCreateDTO dto)
        {
            try
            {
                if (dto == null)
                {
                    throw new ArgumentException();
                }

                await _applicationService.UpdateAsync(dto);

                MessageDTO message = new MessageDTO()
                {
                    Mensagem = "Dados atualizados com sucesso!"
                };

                return Ok(message);
            }
            catch (Exception ex)
            {
                return BadRequest("Erro ao tentar salvar os dados");
            }
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int Id)
        {
            try
            {
                await _applicationService.RemoveAsync(Id);

                MessageDTO message = new MessageDTO()
                {
                    Mensagem = "Registro excluído com sucesso!"
                };

                return Ok(message);
            }
            catch (Exception ex)
            {
                return BadRequest("Erro ao deletar o registro.");
            }
        }
    }
}