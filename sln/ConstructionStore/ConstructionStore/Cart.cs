//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConstructionStore
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cart
    {
        public int ID { get; set; }
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public int UserID { get; set; }
    
        public virtual Products Products { get; set; }
        public virtual Users Users { get; set; }
    }
}