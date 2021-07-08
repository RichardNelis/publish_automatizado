using System.Collections.Generic;
using Newtonsoft.Json;

public class DependenciaDTO
{    
    [JsonProperty("sistema_cn")]
    public ICollection<SistemaCNDTO> SistemaCNDTOs { get; set; }
}