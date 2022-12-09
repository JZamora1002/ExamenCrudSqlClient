using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Libro
    {
        public static ML.Result GetAll()
        {
            ML.Libro libro = new ML.Libro();
            libro.Editorial = new ML.Editorial();
            libro.Autor = new ML.Autor();
            libro.Genero = new ML.Genero();
            ML.Result result = new ML.Result();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "LibroGeAll";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = context;

                        DataTable tableLibro = new DataTable();
                        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                        dataAdapter.Fill(tableLibro);
                        cmd.Connection.Open();
                        if (tableLibro.Rows.Count > 0)
                        {
                            result.Objects = new List<object>();
                            foreach (DataRow row in tableLibro.Rows)
                            {
                                libro.IdLibro = Int32.Parse(row[0].ToString());
                                libro.Nombre = row[1].ToString();
                                libro.Autor.IdAutor = Int32.Parse(row[2].ToString());
                                libro.Autor.Nombre = row[3].ToString();
                                libro.NumeroPaginas = Int32.Parse(row[4].ToString());
                                libro.FechaPublicacion = row[5].ToString();
                                libro.Editorial.IdEditorial = Int32.Parse(row[6].ToString());
                                libro.Editorial.Nombre = row[7].ToString();
                                libro.Edicion = row[8].ToString();
                                libro.Genero.IdGenero = Int32.Parse(row[9].ToString());
                                libro.Genero.Nombre = row[10].ToString();

                                result.Objects.Add(libro);
                            }
                            result.Correct = true;
                        }
                        else
                        {
                            result.Correct = false;
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }

        public static ML.Result GetById(ML.Libro libro1)
        {
            ML.Libro libro = new ML.Libro();
            libro.Editorial = new ML.Editorial();
            libro.Autor = new ML.Autor();
            libro.Genero = new ML.Genero();
            ML.Result result = new ML.Result();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "LibroGetById";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = context;
                        SqlParameter[] collection = new SqlParameter[1]; 

                        collection[0] = new SqlParameter("@IdLibro", SqlDbType.Int);
                        collection[0].Value = libro1.IdLibro;
                        cmd.Parameters.AddRange(collection);
                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();

                        DataTable tableLibro = new DataTable();
                        SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                        dataAdapter.Fill(tableLibro);

                        if (tableLibro.Rows.Count > 0)
                        {
                            DataRow row = tableLibro.Rows[0];
                            libro.IdLibro = Int32.Parse(row[0].ToString());
                            libro.Nombre = row[1].ToString();
                            libro.Autor.IdAutor = Int32.Parse(row[2].ToString());
                            libro.Autor.Nombre = row[3].ToString();
                            libro.NumeroPaginas = Int32.Parse(row[4].ToString());
                            libro.FechaPublicacion = row[5].ToString();
                            libro.Editorial.IdEditorial = Int32.Parse(row[6].ToString());
                            libro.Editorial.Nombre = row[7].ToString();
                            libro.Edicion = row[8].ToString();
                            libro.Genero.IdGenero = Int32.Parse(row[9].ToString());
                            libro.Genero.Nombre = row[10].ToString();

                            result.Object= libro;
                            
                            result.Correct = true;
                        }
                        else
                        {
                            result.Correct = false;
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }

        public static ML.Result Add(ML.Libro libro)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "LibroAdd";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = context;

                        SqlParameter[] collection = new SqlParameter[7];

                        collection[0] = new SqlParameter("@Nombre", SqlDbType.VarChar);
                        collection[0].Value = libro.Nombre;

                        collection[1] = new SqlParameter("@IdAutor", SqlDbType.Int);
                        collection[1].Value = libro.Autor.IdAutor;

                        collection[2] = new SqlParameter("@NumeroPaginas", SqlDbType.Int);
                        collection[2].Value = libro.NumeroPaginas;

                        collection[3] = new SqlParameter("@FechaPublicacion", SqlDbType.VarChar);
                        collection[3].Value = DateTime.Parse(libro.FechaPublicacion);

                        collection[4] = new SqlParameter("@IdEditorial", SqlDbType.Int);
                        collection[4].Value = libro.Editorial.IdEditorial;

                        collection[5] = new SqlParameter("@Edicion", SqlDbType.VarChar);
                        collection[5].Value = libro.Edicion;

                        collection[6] = new SqlParameter("@IdGenero", SqlDbType.Int);
                        collection[6].Value = libro.Genero.IdGenero;

                        cmd.Parameters.AddRange(collection);
                        cmd.Connection.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            result.Correct = true;
                        }
                        else
                        {
                            result.Correct = false;
                        }
                    }
                }
            }
            catch (Exception ex )
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }

        public static ML.Result Update(ML.Libro libro)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "LibroUpdate";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = context;

                        SqlParameter[] collection = new SqlParameter[8];

                        collection[0] = new SqlParameter("@Nombre", SqlDbType.VarChar);
                        collection[0].Value = libro.Nombre;

                        collection[1] = new SqlParameter("@IdAutor", SqlDbType.Int);
                        collection[1].Value = libro.Autor.IdAutor;

                        collection[2] = new SqlParameter("@NumeroPaginas", SqlDbType.Int);
                        collection[2].Value = libro.NumeroPaginas;

                        collection[3] = new SqlParameter("@FechaPublicacion", SqlDbType.VarChar);
                        collection[3].Value = DateTime.Parse(libro.FechaPublicacion);

                        collection[4] = new SqlParameter("@IdEditorial", SqlDbType.Int);
                        collection[4].Value = libro.Editorial.IdEditorial;

                        collection[5] = new SqlParameter("@Edicion", SqlDbType.VarChar);
                        collection[5].Value = libro.Edicion;

                        collection[6] = new SqlParameter("@IdGenero", SqlDbType.Int);
                        collection[6].Value = libro.Genero.IdGenero;

                        collection[7] = new SqlParameter("@IdLibro", SqlDbType.Int);
                        collection[7].Value = libro.IdLibro;

                        cmd.Parameters.AddRange(collection);
                        cmd.Connection.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            result.Correct = true;
                        }
                        else
                        {
                            result.Correct = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }

        public static ML.Result Delete(ML.Libro libro1)
        {
            
            ML.Result result = new ML.Result();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "LibroGetById";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Connection = context;
                        SqlParameter[] collection = new SqlParameter[1];

                        collection[0] = new SqlParameter("@IdLibro", SqlDbType.Int);
                        collection[0].Value = libro1.IdLibro;
                        cmd.Parameters.AddRange(collection);
                        cmd.Connection.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            result.Correct = true;
                        }
                        else
                        {
                            result.Correct = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }
            return result;
        }
    }
}
