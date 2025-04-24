using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteca.DataAccess.Repositories
{
    public interface IRepository<T>
    {
        public IEnumerable<T> List();
        public int Insert(T item);
        public int Update(T item);
        public int Delete(int? id, string UsuarioId);
        public T Find(int? id);
    }
}
