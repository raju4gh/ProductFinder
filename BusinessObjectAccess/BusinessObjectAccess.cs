using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace ProductFinderService
{
    public class BusinessObjectAccess
    {
        Model1Container context = new Model1Container();

        public bool ValidateUser(string username,int reviewID)
        {
            if(context.Reviews.Where(rvr=>rvr.Id==reviewID && rvr.UserName==username).Count()>0) 
            {
                return true;
            }
            return false;
        }

        public bool ReviewExists(int review_ID)
        {
           if( context.Reviews.Count<Review>(rvr => rvr.Id == review_ID)>0)
           {
               return true;
           }
           return false;
        }

        public bool ProductExists(int product_ID)
        {
            if (context.Products.Count<Product>(prd => prd.Id == product_ID) > 0)
            {
                return true;
            }
            return false;
        }

        public bool ValidateStars(int stars)
        {
            if (stars >= 0 && stars <= 5)
                return true;
            else
                return false;
        }
       public List<Review> GetReviews(int ProuctID)
       {
               return context.Reviews.Where(a => a.ProductId == ProuctID).ToList();
       }

        
        public void CreateReviews(int ProuctID, int stars,string commetnts,string username)
        {
                    Review rvr = new Review()
                    {
                        ProductId = ProuctID,
                        Comments = commetnts,
                        Stars = stars,
                        UserName = username
                    };
                    context.Reviews.Add(rvr);
                    context.SaveChanges();
        }

         
        public void UpdateReviews(int ReviewID, string comments, int stars)
         {
             if (ReviewExists(ReviewID))
             {
                 if (ValidateStars(stars))
                 {
                     Review currentReview = context.Reviews.FirstOrDefault(rvr => rvr.Id == ReviewID);
                     currentReview.Comments = comments;
                     currentReview.Stars = stars;
                     context.SaveChanges();
                 }
                 else
                     throw new Exception("Invalid data -stars");
             }
             else
                 throw new Exception("Review not found");
         }

          
         public void DeleteReviews(int ReviewID)
         {
             if (ReviewExists(ReviewID))
             {
                 context.Reviews.Remove(context.Reviews.FirstOrDefault(rvr => rvr.Id == ReviewID));
             }
             else
                 throw new Exception("Review not found");
         }
    }
}