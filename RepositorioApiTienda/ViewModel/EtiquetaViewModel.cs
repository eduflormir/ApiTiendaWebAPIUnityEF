using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RepositorioApiTienda.Model;
using BaseRepositorio.ViewModel;

namespace RepositorioApiTienda.ViewModel
{
    public class EtiquetaViewModel:IViewModel<Etiqueta>
    {
        public int id_etiqueta { get; set; }
        public string texto { get; set; }

        public Etiqueta ToBaseDatos()
        {
            return new Etiqueta()
            {
                id_etiqueta = id_etiqueta,
                texto = texto
            };
        }

        public void FromBaseDatos(Etiqueta modelo)
        {
            id_etiqueta = modelo.id_etiqueta;
            texto = modelo.texto;
        }

        public void UpdateBaseDatos(Etiqueta modelo)
        {
            modelo.id_etiqueta = id_etiqueta;
            modelo.texto = texto;
        }

        public object[] GetKeys()
        {
            return new[] { (object)id_etiqueta };
        }
    }
}
