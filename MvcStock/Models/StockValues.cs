using System;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;

namespace MvcStock.Models
{
    public class StockValues
    {
        [Key]
        public int Id { get; set; }

        public DateTime date { get; set; }

        public string wig { get; set; }

        public string wig20 { get; set; }

        public string wig20fut { get; set; }

        public string wig20usd { get; set; }

        public string mwig40 { get; set; }

        public string swig80 { get; set; }
    }
    class StockValuesContext : DbContext
    {
        public DbSet<StockValues> StockValuesSet { get; set; }
    }

}