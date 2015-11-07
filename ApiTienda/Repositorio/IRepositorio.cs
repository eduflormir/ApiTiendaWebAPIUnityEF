using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Repositorio
{
    public interface IRepositorio<TModelo, TViewModel> where TModelo : class where TViewModel : IViewModel<TModelo>
    {
        // Con Where creo una restricccion

        // 1. Datos para el elemento del Modelo (TModelo)
        // 2. Datos para el View Model

        TViewModel Add(TViewModel model);
        int Borrar(TViewModel model); // devuelve el numero de registros borrados

        int Borrar(Expression<Func<TModelo, bool>> consulta);

        int Actualizar(TViewModel model); // devuelve el numero de registros actualizados
        ICollection<TViewModel> Get(); // devuelve todos los datos
        TViewModel Get(params Object[] keys); // params: Array de Objects que pasa las claves primarias

        // Con lambda
        // Func es un delegado: programar una funcion dentro
        // o=> es Func
        // bool es

        ICollection<TViewModel> Get(Expression<Func<TModelo, bool>> consulta);
    }
}
