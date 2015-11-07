using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;

namespace Repositorio
{
    public class RepositorioEntity<TModelo, TViewModel> : IRepositorio<TModelo, TViewModel> where TModelo : class
                                                                                                               where TViewModel : IViewModel<TModelo>, new()// que se puede construir, asi evitamos clases abstractas e interfaces

    {
        private DbContext context; // defino objeto para manejar la conexión

        protected DbSet<TModelo> DbSet
        {
            // instancio desde la base de datos el modelo
            get { return context.Set<TModelo>(); }
        } // que sea accesible por sus hijos

        // Se encarga de conectar a la base de datos
        public RepositorioEntity(DbContext context)
        {
            this.context = context;
        }


        public TViewModel Add(TViewModel model)
        {
            var m = model.ToBaseDatos(); // me devuelve objeto TModelo
            // necesito el DBSet para poder agregar
            DbSet.Add(m);
            try
            {
                context.SaveChanges();
                model.FromBaseDatos(m);
                return model;
            }
            catch (Exception)
            {
                // devuelve el tipo por defecto del tipo TViewModel, ya sea Object o null
                // otra opcion es lanzar una excepcion
                // aqui debe escribir en LOG el detalle de la exccepcion, fecha, etc
                return default(TViewModel);
            }
        }

        public int Borrar(TViewModel model)
        {
            var obj = DbSet.Find(model.GetKeys()); // Obtengo objeto TModel para poder borrarlo
            DbSet.Remove(obj);
            try
            {
                return context.SaveChanges();
            }
            catch (Exception)
            {

                return 0;
            }

        }

        public int Borrar(Expression<Func<TModelo, bool>> consulta)
        {
            var data = DbSet.Where(consulta);
            DbSet.RemoveRange(data);
            try
            {
                return context.SaveChanges(); // me devuelve con int el numero de cambios que ha hecho
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public int Actualizar(TViewModel model)
        {
            var obj = DbSet.Find(model.GetKeys());
            model.UpdateBaseDatos(obj);

            try
            {
                return context.SaveChanges();
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public ICollection<TViewModel> Get()
        {
            var data = new List<TViewModel>();

            foreach (var modelo in DbSet)
            {
                TViewModel obj = new TViewModel();
                obj.FromBaseDatos(modelo);
                data.Add(obj);
            }
            return data;
        }

        public TViewModel Get(params object[] keys)
        {
            var dato = DbSet.Find(keys); // hago la consulta con TModel
            var retorno = new TViewModel();
            retorno.FromBaseDatos(dato); // hago la conversión de TModel a ViewModel

            return retorno; // retorno objeto ViewModel
        }

        public ICollection<TViewModel> Get(Expression<Func<TModelo, bool>> consulta)
        {
            var datos0 = DbSet.Where(consulta); // hago la consulta con TModel
            var data = new List<TViewModel>(); // preparo una lista de TViewModel

            foreach (var modelo in datos0)
            {
                TViewModel obj = new TViewModel();
                obj.FromBaseDatos(modelo); // hago la conversion
                data.Add(obj);
            }
            return data;
        }


    }
}
