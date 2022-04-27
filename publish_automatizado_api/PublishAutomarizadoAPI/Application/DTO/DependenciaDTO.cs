using Newtonsoft.Json;
using System.Collections.Generic;

public class DependenciaDTO
{
    [JsonProperty("sistema_cn")]
    public ICollection<SistemaCNDTO> SistemaCNDTOs { get; set; }
}