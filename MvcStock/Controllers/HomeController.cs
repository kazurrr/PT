using System;
using System.Web.Mvc;
using MvcStock.Api;

namespace MvcStock.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        private StockManager stockMan = StockManager.Instance;

        public ActionResult Index()
        {
            if (!stockMan.isWorking)
            {
                stockMan.StartRefreshingStockValues((int)TimeSpan.FromSeconds(30).TotalMilliseconds);
            }

            return View();
        }
    }
}
