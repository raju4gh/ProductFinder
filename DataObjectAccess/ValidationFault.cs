using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace ProductFinderService
{
    [DataContract]
    public class ValidationFault
    {
        public ValidationFault(bool result, string message, string description)
        {
            Result = result;
            Message = message;
            Description = description;
        }

        public ValidationFault(bool result, string message)
        {
            Result = result;
            Message = message;
            Description = message;
        }
        [DataMember]
        public bool Result { get; set; }
        [DataMember]
        public string Message { get; set; }
        [DataMember]
        public string Description { get; set; }
    }
}