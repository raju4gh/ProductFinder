//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Runtime.Serialization; 

namespace ProductFinderService
{
    using System;
    using System.Collections.Generic;
    
    [DataContract]
    public partial class Image
    {
    	[DataMember]
        public int Id { get; set; }
    	[DataMember]
        public string ImageURI { get; set; }
    	[DataMember]
        public int ProductId { get; set; }
    
        public virtual Product Product { get; set; }
    }
}
