using System.Data.Entity;
using Microsoft.Practices.Unity;
using System.Web.Http;
using RepositorioApiTienda.Model;
using RepositorioApiTienda.ViewModel;
using BaseRepositorio.Repositorio;
using Unity.WebApi;


namespace ApiTienda
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {

            var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();
            
            // Registro de todas las dependencias
            // REPOSITORIO, crear un dbcontext con el constructor de Tienda25Entities
            container.RegisterType<DbContext, Tienda25Entities>();
            container.RegisterType<IRepositorio<Producto, ProductoViewModel>,
            RepositorioEntity<Producto, ProductoViewModel>>();

            container.RegisterType<IRepositorio<Almacen_Producto, AlmacenProductoViewModel>,
            RepositorioEntity<Almacen_Producto, AlmacenProductoViewModel>>();


            // para escribir logs
            // para enviar emails

            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}