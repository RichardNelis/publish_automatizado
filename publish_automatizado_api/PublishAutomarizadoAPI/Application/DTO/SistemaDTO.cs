using Newtonsoft.Json;
using System.Collections.Generic;

public class SistemaDTO : BaseDTO
{
    [JsonProperty(PropertyName = "nome_sistema", Order = 2)]
    public string NomeSistema { get; set; }

    [JsonProperty("caminho_sistema", Order = 3)]
    public string CaminhoSistema { get; set; }

    [JsonProperty("dependencia", Order = 4)]
    public DependenciaDTO Dependencia { get; set; }    
}