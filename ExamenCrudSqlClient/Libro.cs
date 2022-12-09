using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PL
{
    public class Libro
    {
        public static void Add()
        {
            ML.Libro libro = new ML.Libro();
            libro.Editorial = new ML.Editorial();
            libro.Autor = new ML.Autor();
            libro.Genero = new ML.Genero();
            ML.Result result = new ML.Result();

            Console.WriteLine("INGRESA EL NOMBRE DEL LIBRO: ");
            libro.Nombre = Console.ReadLine();

            Console.WriteLine("INGRESA EL ID DEL AUTOR: ");
            libro.Autor.IdAutor = Int32.Parse(Console.ReadLine());

            Console.WriteLine("INGRESA EL # DE PAGINAS: ");
            libro.NumeroPaginas = Int32.Parse(Console.ReadLine()); 

            Console.WriteLine("INGRESA LA FECHA DE PUBLICACION: ");
            libro.FechaPublicacion = Console.ReadLine();

            Console.WriteLine("INGRESA EL ID DE LA EDITORIAL: ");
            libro.Editorial.IdEditorial = Int32.Parse(Console.ReadLine());

            Console.WriteLine("INGRESA LA EDICION DEL LIBRO: ");
            libro.Edicion = Console.ReadLine();

            Console.WriteLine("INGRESA EL ID DEL GENERO: ");
            libro.Genero.IdGenero = Int32.Parse(Console.ReadLine());

            result = BL.Libro.Add(libro);
            if (result.Correct == true)
            {
                Console.Clear();
                Console.WriteLine("LIBRO REGISTRADO CON EXITO ");
                Console.ReadKey();
            }
            else
            {
                Console.Clear();
                
                Console.WriteLine("LIBRO NO REGISTRADO POR "+result.ErrorMessage);
                Console.ReadKey();
            }
        }

        public static void Update()
        {
            ML.Libro libro = new ML.Libro();
            libro.Editorial = new ML.Editorial();
            libro.Autor = new ML.Autor();
            libro.Genero = new ML.Genero();
            ML.Result result = new ML.Result();



            Console.WriteLine("INGRESA EL ID DEL LIBRO: ");
            libro.IdLibro = Int32.Parse(Console.ReadLine());

            Console.Clear();

            Console.WriteLine("INGRESA EL NOMBRE DEL LIBRO: ");
            libro.Nombre = Console.ReadLine();

            Console.WriteLine("INGRESA EL ID DEL AUTOR: ");
            libro.Autor.IdAutor = Int32.Parse(Console.ReadLine());

            Console.WriteLine("INGRESA EL # DE PAGINAS: ");
            libro.NumeroPaginas = Int32.Parse(Console.ReadLine());

            Console.WriteLine("INGRESA LA FECHA DE PUBLICACION: ");
            libro.FechaPublicacion = Console.ReadLine();

            Console.WriteLine("INGRESA EL ID DE LA EDITORIAL: ");
            libro.Editorial.IdEditorial = Int32.Parse(Console.ReadLine());

            Console.WriteLine("INGRESA LA EDICION DEL LIBRO: ");
            libro.Edicion = Console.ReadLine();

            Console.WriteLine("INGRESA EL ID DEL GENERO: ");
            libro.Genero.IdGenero = Int32.Parse(Console.ReadLine());

            result = BL.Libro.Update(libro);
            if (result.Correct == true)
            {
                Console.Clear();
                Console.WriteLine("LIBRO ACTUALIZADO CON EXITO ");
                Console.ReadKey();
            }
            else
            {
                Console.Clear();
                Console.WriteLine("LIBRO NO ACTUALIZADO POR " + result.ErrorMessage);
                Console.ReadKey();
            }
        }

        public static void Delete()
        {
            ML.Result result = new ML.Result();
            ML.Libro libro = new ML.Libro();

            Console.Clear();

            Console.WriteLine("INGRESA EL ID DEL LIBRO: ");
            libro.IdLibro = Int32.Parse(Console.ReadLine());

            result = BL.Libro.Delete(libro);
           
            if (result.Correct == true)
            {
                Console.Clear();
                Console.WriteLine("LIBRO ELIMINADO CON EXITO ");
                Console.ReadKey();
            }
            else
            {
                Console.Clear();
                Console.WriteLine("LIBRO NO ELIMINADO POR " + result.ErrorMessage);
                Console.ReadKey();
            }

        }

        public static void GetById()
        {
            ML.Result result = new ML.Result();
            ML.Libro libro = new ML.Libro();

            Console.Clear();

            Console.WriteLine("INGRESA EL ID DEL LIBRO: ");
            libro.IdLibro = Int32.Parse(Console.ReadLine());

            result = BL.Libro.GetById(libro);
            
            if (result.Correct == true)
            {
                libro = (ML.Libro)result.Object;

                Console.WriteLine("ID DEL LIBRO: "+libro.IdLibro);
                Console.WriteLine("NOMBRE DEL LIBRO: "+libro.Nombre);
                Console.WriteLine("AUTOR DEL LIBRO: "+libro.Autor.Nombre);
                Console.WriteLine("NUMERO DE PAGINAS DEL LIBRO: "+libro.NumeroPaginas);
                Console.WriteLine("FECHA DE PUBLICACION DEL LIBRO: "+libro.FechaPublicacion);
                Console.WriteLine("EDITORIAL DEL LIBRO: "+libro.Editorial.Nombre);
                Console.WriteLine("EDICION DEL LIBRO: "+libro.Edicion);
                Console.WriteLine("GENERO DEL LIBRO: "+libro.Genero.Nombre);

                Console.ReadKey();
            }
            else
            {
                Console.Clear();
                Console.WriteLine("LIBRO NO ENCONTRADO POR " + result.ErrorMessage);
                Console.ReadKey();
            }

        }

        public static void GetAll()
        {
            ML.Result result = new ML.Result();
            ML.Libro libro = new ML.Libro();

            Console.Clear();

            result = BL.Libro.GetAll();
            libro.Libros = result.Objects;
            if (result.Correct == true)
            {
                foreach (ML.Libro obj in libro.Libros)
                {
                    Console.WriteLine("===================================================================");
                    Console.WriteLine("ID DEL LIBRO: " + obj.IdLibro);
                    Console.WriteLine("NOMBRE DEL LIBRO: " + obj.Nombre);
                    Console.WriteLine("AUTOR DEL LIBRO: " + obj.Autor.Nombre);
                    Console.WriteLine("NUMERO DE PAGINAS DEL LIBRO: " + obj.NumeroPaginas);
                    Console.WriteLine("FECHA DE PUBLICACION DEL LIBRO: " + obj.FechaPublicacion);
                    Console.WriteLine("EDITORIAL DEL LIBRO: " + obj.Editorial.Nombre);
                    Console.WriteLine("EDICION DEL LIBRO: " + obj.Edicion);
                    Console.WriteLine("GENERO DEL LIBRO: " + obj.Genero.Nombre);
                    Console.WriteLine("===================================================================");

                }
                Console.ReadKey();


            }
            else
            {
                Console.Clear();
                Console.WriteLine("LIBRO NO ENCONTRADO POR " + result.ErrorMessage);
                Console.ReadKey();
            }

        }
    }

}
