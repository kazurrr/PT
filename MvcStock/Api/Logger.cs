using MvcStock.Models;

namespace MvcStock.Api
{
    class Logger
    {
        public void LogValues(StockValues data)
        {
            var stc = new StockValuesContext();

            stc.StockValuesSet.Add(data);

            stc.SaveChanges();
        }

    }
}
