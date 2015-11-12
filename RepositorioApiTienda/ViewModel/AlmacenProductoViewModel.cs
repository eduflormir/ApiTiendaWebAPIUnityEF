using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RepositorioApiTienda.Model;
using BaseRepositorio.ViewModel;

namespace RepositorioApiTienda.ViewModel
{
    public class AlmacenProductoViewModel:IViewModel<Almacen_Producto>
    {
        public int id_almacen { get; set; }
        public int id_producto { get; set; }
        public int existencias { get; set; }
        public String Almacen { get; set; }



        public Almacen_Producto ToBaseDatos()
        {
            return new Almacen_Producto()
            {
                id_almacen = id_almacen,
                id_producto = id_producto,
                existencias = existencias
            };
        }

        public void FromBaseDatos(Almacen_Producto modelo)
        {
            id_almacen = modelo.id_almacen;
            id_producto = modelo.id_producto;
            existencias = modelo.existencias;
        }

        public void UpdateBaseDatos(Almacen_Producto modelo)
        {
            modelo.id_almacen = id_almacen;
            modelo.id_producto = id_producto;
            modelo.existencias = existencias;
        }

        public object[] GetKeys()
        {
            throw new NotImplementedException();
        }
    }
}
