using Biblioteca.BusinessLogic.Services;
using Biblioteca.DataAccess;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca.BusinessLogic
{
    public static class ServiceConfiguration
    {
        public static void DataAccess(this IServiceCollection services, string connection)
        {
            BibliotecaContext.BuildConnectionString(connection);

        }

        public static void BusinessLogic(this IServiceCollection services)
        {
            services.AddScoped<AccessService>();
            services.AddScoped<GeneralServices>();
        }
    }
}
