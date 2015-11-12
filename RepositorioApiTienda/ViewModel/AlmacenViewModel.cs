using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RepositorioApiTienda.Model;
using BaseRepositorio.ViewModel;

namespace RepositorioApiTienda.ViewModel
{
    class AlmacenViewModel:IViewModel<Almacen>
    {

        public int id_almacen { get; set; }
        public string ciudad { get; set; }
        public int codigo_postal { get; set; }

        public Almacen ToBaseDatos()
        {
            return new Almacen()
            {
                id_almacen = id_almacen,
                ciudad = ciudad,
                codigo_postal = codigo_postal
            };
        }

        public void FromBaseDatos(Almacen modelo)
        {
            id_almacen = modelo.id_almacen;
            ciudad = modelo.ciudad;
            codigo_postal = modelo.codigo_postal;
        }

        public void UpdateBaseDatos(Almacen modelo)
        {
            modelo.id_almacen = id_almacen;
            modelo.ciudad = ciudad;
            modelo.codigo_postal = codigo_postal;
        }

        public object[] GetKeys()
        {
            return new object[] {id_almacen};
        }
    }
}
