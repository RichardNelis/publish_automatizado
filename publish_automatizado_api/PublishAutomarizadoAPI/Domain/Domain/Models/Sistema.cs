using System.ComponentModel.DataAnnotations.Schema;

namespace PublishAutomarizadoAPI.Domain.Domain.Models
{
    [Table("sistema")]
    public class Sistema : Base
    {
        [Column("nome_sistema")]
        public string NomeSistema { get; set; }

        [Column("caminho_sistema")]
        public string CaminhoSistema { get; set; }

        public virtual Dependencia Dependencia { get; set; }
    }
}