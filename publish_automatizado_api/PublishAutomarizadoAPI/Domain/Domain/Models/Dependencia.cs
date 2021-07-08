using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace PublishAutomarizadoAPI.Domain.Domain.Models
{
    [Table("dependencia")]
    public class Dependencia : Base
    {
        [Column("es_sistema")]
        public int EsSistema { get; set; }

        [Column("es_sistema_cn")]
        public int? EsSistemaCN { get; set; }

        [ForeignKey("EsSistema")]
        public virtual Sistema Sistema { get; set; }

        [ForeignKey("EsSistemaCN")]
        public virtual SistemaCN SistemaCN { get; set; }

        [NotMapped]
        public virtual ICollection<SistemaCN> SistemaCNs { get; set; }
    }
}