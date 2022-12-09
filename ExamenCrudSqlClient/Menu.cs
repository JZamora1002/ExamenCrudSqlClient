using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PL
{
    public class Menu
    {
        static void Main(string[] args)
        {
            Console.WriteLine("ESCOJE UNA OPCION: \n\n 1.- Añadir Libro, \n 2.-Actualizar Libro \n 3.- Eliminar Libro \n 4- Consultar 1 Libro \n 5.- Consultar Todos Los Libros");
            int a = Int32.Parse(Console.ReadLine());
            switch (a)
            {
                case 1:
                    PL.Libro.Add();
                    break;
                case 2:
                    PL.Libro.Update();
                    break;
                case 3:
                    PL.Libro.Delete();
                    break;
                case 4:
                    PL.Libro.GetById();
                    break;
                case 5:
                    PL.Libro.GetAll();
                    break;
            }
        }
    }
}
