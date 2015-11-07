using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Repositorio;
using RepositorioApiTienda.Models;

namespace RepositorioApiTienda.ViewModels
{
    public class ProductoViewModel : IViewModel<Producto>
    {

        #region Tipos Primitivos de la entidad Producto

        public int id_producto { get; set; }
        public string fabricante_nombre { get; set; }
        public string descripcion_corta { get; set; }
        public decimal precio_coste { get; set; }
        public decimal precio_venta { get; set; }
        public int id_categoria { get; set; }

        #endregion



        public void FromBaseDatos(Producto modelo)
        {
            id_producto = modelo.id_producto;
            fabricante_nombre = modelo.fabricante_nombre;
            descripcion_corta = modelo.descripcion_corta;
            precio_coste = modelo.precio_coste;
            precio_venta = modelo.precio_venta;
            id_categoria = modelo.id_categoria;
        }

        public object[] GetKeys()
        {
            return new[] { (object)id_producto };
        }

        public Producto ToBaseDatos()
        {

            return new Producto()
            {
             id_producto   = id_producto,
             fabricante_nombre = fabricante_nombre,
             descripcion_corta = descripcion_corta,
             precio_coste = precio_coste,
             precio_venta = precio_venta,
             id_categoria = id_categoria
            };
            
        }

        public void UpdateBaseDatos(Producto modelo)
        {
            modelo.id_producto = id_producto;
            modelo.fabricante_nombre = fabricante_nombre;
            modelo.descripcion_corta = descripcion_corta;
            modelo.precio_coste = precio_coste;
            modelo.precio_venta = precio_venta;
            modelo.id_categoria = id_categoria;
        }
    }
}
