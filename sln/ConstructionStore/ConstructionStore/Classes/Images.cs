using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace ConstructionStore
{
    public partial class Images
    {
        public string ImagePath
        {
            get
            {
                return $"../../Images/{Path}";
            }
        }
    }
}
