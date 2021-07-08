using Newtonsoft.Json;
using System.Collections.Generic;

public class ChamadoDTO
{
    [JsonProperty("es_sistemas")]
    public ICollection<int> EsSistemas { get; set; }

    [JsonProperty("numero_chamado")]
    public string NumeroChamado { get; set; }

    [JsonProperty("responsavel")]
    public string Resposavel { get; set; }

    [JsonProperty("municipio")]
    public string Municipio { get; set; }
}