namespace Repositorio
{
    public interface IViewModel<TModelo> where TModelo : class
        // cuando TModelo sera de tipo class (de cualquier tipo)
        // no puede ser un tipo primitivo, tiene que ser una clase PErsona por ejemplo

    {
        TModelo ToBaseDatos();
        void FromBaseDatos(TModelo modelo);
        void UpdateBaseDatos(TModelo modelo);
        object[] GetKeys(); // devuelve los elementos clave cuando la PK es compuesta


        // necesito una clase que me pueda servir para cualquier clase
        // voy a usar Generics
        // que se adapte a cualquier tipo de objeto de cualquier aplicación
        // TModelo es un nombre ficticio de una clase para modelar unicamente
        // T es de template



    }
}
