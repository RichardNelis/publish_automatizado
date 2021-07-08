using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PublishAutomarizadoAPI.Domain.Domain.Models
{
    public abstract class Base
    {
        [Key]
        [Column("id_codigo")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int IdCodigo { get; set; }

        [Column("dt_inclusao")]
        public DateTime DataInclusao { get; set; }

        [Column("dt_alteracao")]
        public DateTime? DataAlteracao { get; set; }
    }
}
