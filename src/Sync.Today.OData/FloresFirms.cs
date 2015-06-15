//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sync.Today.OData
{
    using System;
    using System.Collections.Generic;
    
    public partial class FloresFirms
    {
        public int Id { get; set; }
        public System.Guid InternalId { get; set; }
        public string ExternalId { get; set; }
        public System.DateTime CorrectedDATE { get; set; }
        public string Name { get; set; }
        public string VATIdentNumber { get; set; }
        public string WWWAddress { get; set; }
        public decimal ReceivedInvoicesSum { get; set; }
        public decimal IssuedInvoicesSum { get; set; }
        public string Recipient { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string PostCode { get; set; }
        public string ZIP { get; set; }
        public string Country { get; set; }
        public string PhoneNumber1 { get; set; }
        public string PhoneNumber2 { get; set; }
        public string FaxNumber { get; set; }
        public string EMail { get; set; }
        public string Location { get; set; }
        public string CountryCode { get; set; }
        public bool Upload { get; set; }
        public Nullable<int> Tag { get; set; }
        public bool IsNew { get; set; }
        public bool WasJustUpdated { get; set; }
        public string LastDLError { get; set; }
        public string LastUPError { get; set; }
    }
}