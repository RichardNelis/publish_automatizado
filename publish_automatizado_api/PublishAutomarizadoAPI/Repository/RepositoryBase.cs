using Microsoft.EntityFrameworkCore;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

public abstract class RepositoryBase<T> : IDisposable, IRepositoryBase<T> where T : class
{
    private readonly MySqlContext _context;

    public RepositoryBase(MySqlContext Context)
    {
        _context = Context;
    }

    public virtual async Task AddAsync(T obj)
    {
        try
        {
            await _context.Set<T>().AddAsync(obj);
            await _context.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public virtual async Task<T> GetByIdAsync(int id)
    {
        return await _context.Set<T>().FindAsync(id);
    }

    public virtual async Task<ICollection<T>> FetchAll()
    {
        return await _context.Set<T>().ToListAsync();
    }

    public virtual async Task UpdateAsync(T obj)
    {
        try
        {
            _context.Entry(obj).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public virtual async Task RemoveAsync(T obj)
    {
        try
        {
            _context.Set<T>().Remove(obj);
            await _context.SaveChangesAsync();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public virtual void Dispose()
    {
        _context.Dispose();
    }
}