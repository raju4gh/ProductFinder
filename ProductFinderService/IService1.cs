using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;


namespace ProductFinderService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IProductGetterService
    {

        [OperationContract]
        List<Review> GetReviews(int ProuctID);

         [OperationContract]
        void CreateReviews(int ProuctID, string user, string coments, int stars);

         [OperationContract]
         void UpdateReviews(int rvrID, string comments, int stars,string username);

          [OperationContract]
        void  DeleteReviews(int ReviewID,string username);
    }

    //[DataContract]
    // public partial class Product
    //{
    //    [DataMember]
    //    public int Id { get; set; }
    //    [DataMember]
    //    public string DisplayName { get; set; }
    //    [DataMember]
    //    public System.DateTime RevisionDate { get; set; }
    //    [DataMember]
    //    public string Title { get; set; }
    //    [DataMember]
    //    public int ListOrderOverride { get; set; }
    //    [DataMember]
    //    public string ShortDescription { get; set; }
    //    [DataMember]
    //    public int IndustryId { get; set; }
    //    [DataMember]
    //    public int CategoryId { get; set; }
    //    [DataMember]
    //    public int BrandId { get; set; }
    //    [DataMember]
    //    public virtual ICollection<Image> Images { get; set; }
    //    [DataMember]
    //    public virtual Industry Industry { get; set; }
    //    [DataMember]
    //    public virtual Category Category { get; set; }
    //    [DataMember]
    //    public virtual Brand Brand { get; set; }
    //    [DataMember]
    //    public virtual ICollection<Review> Reviews { get; set; }
        
    //}
    // [DataContract]
    // public partial class Review
    //{
    //     [DataMember]
    //    public int Id { get; set; }
    //     [DataMember]
    //    public int Stars { get; set; }
    //     [DataMember]
    //    public string Comments { get; set; }
    //     [DataMember]
    //    public int ProductId { get; set; }
    //     [DataMember]
    //    public string UserName { get; set; }
    //     [DataMember]
    //    public virtual Product Product { get; set; }
    //}

}
