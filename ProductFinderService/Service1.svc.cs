using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data.Entity;
using BusinessObjectAccess;

namespace ProductFinderService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class ProductGetterService : IProductGetterService
    {

        BusinessObjectAccess objAccess = new BusinessObjectAccess();
        public List<Review> GetReviews(int ProductID)
        {
            try
            {
                if (objAccess.ProductExists(ProductID))
                    return objAccess.GetReviews(ProductID);
                else
                    throw new FaultException<ValidationFault>(new ValidationFault(false, "Prdouct not found"));
            }
            catch (ApplicationException e)
            {
                throw new FaultException<ApplicationException>(e, new FaultReason(e.Message), new FaultCode("sender"));
            }
        }

        public void CreateReviews(int ProuctID, string user, string coments, int stars)
        {
            try
            {
                if (objAccess.ProductExists(ProuctID))
                {
                    if (objAccess.ValidateStars(stars))
                    {
                        objAccess.CreateReviews(ProuctID, stars, coments, user);
                    }
                    else
                        throw new FaultException<ValidationFault>(new ValidationFault(false, "Invalid data -stars"));
                }
                else
                    throw new FaultException<ValidationFault>(new ValidationFault(false, "Prdouct not found"));
            }
            catch (ApplicationException e)
            {
                throw new FaultException<ApplicationException>(e, new FaultReason(e.Message), new FaultCode("sender"));
            }
        }

        public void UpdateReviews(int rvrID, string comments, int stars, string username)
        {
            try
            {
                if (objAccess.ValidateUser(username,rvrID))
                {
                    if (objAccess.ReviewExists(rvrID))
                    {
                        if (objAccess.ValidateStars(stars))
                        {
                            objAccess.UpdateReviews(rvrID, comments, stars);
                        }
                        else
                            throw new FaultException<ValidationFault>(new ValidationFault(false, "Invalid data -stars"));
                    }
                    else
                        throw new FaultException<ValidationFault>(new ValidationFault(false, "Review not found"));
                }
                else
                    throw new FaultException<ValidationFault>(new ValidationFault(false, "User not authorized to perform this task"));
            }
            catch (ApplicationException e)
            {
                throw new FaultException<ApplicationException>(e, new FaultReason(e.Message), new FaultCode("sender")); 
            }
        }

        public void DeleteReviews(int ReviewID, string username)
        {
            try
            {
                if (objAccess.ReviewExists(ReviewID))
                {
                    if (objAccess.ValidateUser(username,ReviewID))
                    {
                        objAccess.DeleteReviews(ReviewID);
                    }
                    else
                        throw new FaultException<ValidationFault>(new ValidationFault(false, "User not authorized to perform this task"));
                }
                else
                    throw new FaultException<ValidationFault>(new ValidationFault(false, "Review not found"));
            }
            catch (ApplicationException e)
            {
                throw new FaultException<ApplicationException>(e, new FaultReason(e.Message), new FaultCode("sender"));
            }
        }
    }
}
