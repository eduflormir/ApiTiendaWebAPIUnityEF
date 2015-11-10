using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Microsoft.Practices.Unity;
using RepositorioApiTienda.Model;
using RepositorioApiTienda.ViewModel;
using RepositorioBase.Repositorio;

namespace ApiTienda.Controllers
{
    public class ProductosController : ApiController
    {
        public Tienda25Entities context;

        [Dependency] // con este decorador le indico a Unity que inyecte
        // instanciar Repositorio
        public IRepositorio<Producto, ProductoViewModel> repo { get; set; }

        
        // lista de productos
        public List<ProductoViewModel> Get()
        {
            return repo.Get().ToList();
        }

        [ResponseType(typeof(ProductoViewModel))]

        public IHttpActionResult Get(int id)
        {
            var data = repo.Get(id);
            if (data == null)
                return NotFound();

            return Ok(data);
        }
        // POST, Agregar
        [ResponseType(typeof(ProductoViewModel))]
        public IHttpActionResult Post([FromBody]ProductoViewModel producto)
        {
            
            try
            {
                repo.Add(producto);
            }
            catch (Exception e)
            {
                return BadRequest("Error en el alta");
            }

            return Created("ApiTienda", producto);


        }


        // PUT, Actualizar
        [ResponseType(typeof(int))]
        public IHttpActionResult Put([FromBody]ProductoViewModel producto)
        {
            
            if (repo.Actualizar(producto)==0)
                return NotFound();
            else
                return Ok();
        }

        // DELETE, Borrar
        [ResponseType(typeof(int))]
        public IHttpActionResult Delete(int id)
        {
            var pro = repo.Get(id);
            if (pro == null)
                return NotFound();

            try
            {
                repo.Borrar(pro);
            }
            catch (Exception e)
            {
                return BadRequest("Error en el borrado");
            }
            
            return Ok();
        }

        // DELETE, Borrar
        [ResponseType(typeof(int))]
        public IHttpActionResult Delete([FromBody]ProductoViewModel p)
        {
            
            try
            {
                if(p.descripcion_corta!=null)
                    repo.Borrar(o=>o.descripcion_corta.Contains(p.descripcion_corta));
                if(p.fabricante_nombre!=null)
                    repo.Borrar(o => o.fabricante_nombre.Equals(p.fabricante_nombre));
            }
            catch (Exception e)
            {
                return BadRequest("Error en el borrado");
            }

            return Ok();
        }



    }
}
