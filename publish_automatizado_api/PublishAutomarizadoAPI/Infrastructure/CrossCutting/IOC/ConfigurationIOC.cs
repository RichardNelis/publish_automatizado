using Autofac;
using PublishAutomarizadoAPI.Application.Interfaces;
using PublishAutomarizadoAPI.Application.Service;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Repositorys;
using PublishAutomarizadoAPI.Domain.Core.Interfaces.Services;
using PublishAutomarizadoAPI.Domain.Services;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Interfaces;
using PublishAutomarizadoAPI.Infrastructure.CrossCutting.Adapter.Map;

namespace PublishAutomarizadoAPI.Infrastructure.CrossCutting.IOC
{
    public class ConfigurationIOC
    {
        public static void Load(ContainerBuilder builder)
        {
            #region Registra IOC

            #region IOC Application
            builder.RegisterType<ApplicationServiceSistema>().As<IApplicationServiceSistema>();
            builder.RegisterType<ApplicationServiceSistemaCN>().As<IApplicationServiceSistemaCN>();
            builder.RegisterType<ApplicationServicePublish>().As<IApplicationServicePublish>();
            #endregion

            #region IOC Services
            builder.RegisterType<ServiceSistema>().As<IServiceSistema>();
            builder.RegisterType<ServiceSistemaCN>().As<IServiceSistemaCN>();
            builder.RegisterType<ServiceDependencia>().As<IServiceDependencia>();
            #endregion

            #region IOC Repositorys SQL
            builder.RegisterType<RepositorySistema>().As<IRepositorySistema>();            
            builder.RegisterType<RepositoryDependencia>().As<IRepositoryDependencia>();
            #endregion

            #region IOC Mapper            
            builder.RegisterType<MapperSistema>().As<IMapperSistema>();
            builder.RegisterType<MapperSistemaCN>().As<IMapperSistemaCN>();
            builder.RegisterType<MapperDependencia>().As<IMapperDependencia>();
            #endregion

            #endregion
        }
    }
}
