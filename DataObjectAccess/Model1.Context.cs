﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProductFinderService
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Model1Container : DbContext
    {
        public Model1Container()
            : base("name=Model1Container")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Industry> Industries { get; set; }
        public virtual DbSet<SubIndustry> SubIndustries { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Keyword> Keywords { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Image> Images { get; set; }
        public virtual DbSet<subCategory> subCategories { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
    }
}
