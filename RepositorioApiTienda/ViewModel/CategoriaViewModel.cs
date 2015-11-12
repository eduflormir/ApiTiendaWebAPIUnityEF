using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RepositorioApiTienda.Model;
using BaseRepositorio.ViewModel;

namespace RepositorioApiTienda.ViewModel
{
    public class CategoriaViewModel:IViewModel<Categoria>
    {

        public int id_categoria { get; set; }
        public string nombre { get; set; }

        public Categoria ToBaseDatos()
        {
            return new Categoria()
            {
                id_categoria = id_categoria,
                nombre = nombre
            };
        }

        public void FromBaseDatos(Categoria modelo)
        {
            id_categoria = modelo.id_categoria;
            nombre = modelo.nombre;
        }

        public void UpdateBaseDatos(Categoria modelo)
        {
            modelo.id_categoria = id_categoria;
            modelo.nombre = nombre;
        }

        public object[] GetKeys()
        {
            return new[] { (object)id_categoria };
        }
    }
}
