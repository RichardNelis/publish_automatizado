using System.ComponentModel.DataAnnotations.Schema;

namespace PublishAutomarizadoAPI.Domain.Domain.Models
{
    [Table("sistema_cn")]
    public class SistemaCN : Base
    {
        [Column("nome_sistema")]
        public string NomeSistema { get; set; }

        [Column("caminho_sistema_cn")]
        public string CaminhoSistemaCN { get; set; }

        public virtual Dependencia Dependencia { get; set; }
    }
}