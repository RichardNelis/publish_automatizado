using Microsoft.EntityFrameworkCore;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Domain.Models;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

public class RepositorySistema : RepositoryBase<Sistema>, IRepositorySistema
{
    private readonly MySqlContext _context;

    public RepositorySistema(MySqlContext Context) : base(Context)
    {
        _context = Context;
    }

    public override async Task<Sistema> GetByIdAsync(int id)
    {
        ILookup<int, Sistema> lookup =
        (
            await _context.Sistemas
                .Include(x => x.Dependencia)
                .ThenInclude(x => x.SistemaCN)
                .Select(x => new
                {
                    sis = x,
                    dp = new Dependencia
                    {
                        SistemaCN = x.Dependencia.SistemaCN
                    },
                })
                .Select(x => new Sistema
                {
                    IdCodigo = x.sis.IdCodigo,
                    NomeSistema = x.sis.NomeSistema,
                    CaminhoSistema = x.sis.CaminhoSistema,
                    Dependencia = x.dp,
                })
                .Where(x => x.IdCodigo == id)
                .ToListAsync()
        ).ToLookup(x => x.IdCodigo, x => x);

        return GroupJoin(lookup).FirstOrDefault();
    }

    public override async Task<ICollection<Sistema>> FetchAll()
    {
        ILookup<int, Sistema> lookup =
        (
            await _context.Sistemas
                .Include(x => x.Dependencia)
                .ThenInclude(x => x.SistemaCN)
                .Select(x => new
                {
                    sis = x,
                    dp = new Dependencia
                    {
                        SistemaCN = x.Dependencia.SistemaCN
                    },
                })
                .Select(x => new Sistema
                {
                    IdCodigo = x.sis.IdCodigo,
                    NomeSistema = x.sis.NomeSistema,
                    CaminhoSistema = x.sis.CaminhoSistema,
                    Dependencia = x.dp,
                })                
                .ToListAsync()
        ).ToLookup(x => x.IdCodigo, x => x);

        return GroupJoin(lookup);
    }

    private ICollection<Sistema> GroupJoin(ILookup<int, Sistema> lookup)
    {
        List<Sistema> sistemas = new List<Sistema>();

        foreach (IGrouping<int, Sistema> groupo in lookup)
        {
            foreach (Sistema sg in groupo.Distinct())
            {
                if (sistemas.Any(x => x.IdCodigo == sg.IdCodigo))
                {
                    for (int i = 0; i < sistemas.Count; i++)
                    {
                        Sistema sisIndex = sistemas[i];

                        if (sisIndex.IdCodigo == sg.IdCodigo)
                        {
                            SistemaCN cn = sg.Dependencia.SistemaCN;
                            sisIndex.Dependencia.SistemaCNs.Add(cn);
                        }
                    }
                }
                else
                {
                    if (sg.Dependencia.SistemaCN != null)
                    {
                        sg.Dependencia.SistemaCNs = new List<SistemaCN>();
                        sg.Dependencia.SistemaCNs.Add(sg.Dependencia.SistemaCN);
                    }

                    sistemas.Add(sg);
                }
            }
        }

        return sistemas;
    }
}