using System;
using System.Net;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;

using System.Web.Hosting;

using MvcStock.Models;

namespace MvcStock.Api
{
    class StockManager : IRegisteredObject
    {
        public bool isWorking = false;

        private static readonly StockManager instance = new StockManager();

        private StockManager()
        {
        }

        public static StockManager Instance
        {
            get { return instance; }
        }

        private CancellationTokenSource CancellationToken;
        
        private const string StooqAddr = @"http://stooq.pl/";

        private const string WigId = "aq_wig_c2";

        private const string Wig20Id = "aq_wig20_c2";

        private const string Wig20FutId = "aq_fw20_c0";

        private const string Wig20UsdId = "aq_wig20usd_c2";

        private const string MWig40Id = "aq_mwig40_c2";

        private const string SWig80Id = "aq_swig80_c2";

        private string htmlOutput;

        public void StartRefreshingStockValues(int interval)
        {
            isWorking = true;

            CancellationToken = new CancellationTokenSource();
            var logger = new Logger();

            new Task(() =>
            {
                while (true)
                {
                    if (!CancellationToken.Token.IsCancellationRequested)
                    {
                        var values = LoadStockValues();

                        logger.LogValues(values);

                        Thread.Sleep(interval);
                    }
                    else
                    {
                        break;
                    }
                }
            }, CancellationToken.Token).Start();
        }

        public void StopRefreshingStockValues()
        {
            isWorking = false;
            CancellationToken.Cancel();
        }

        private StockValues LoadStockValues()
        {
            var values = new StockValues();

            var wc = new WebClient();

            try
            {
                htmlOutput = wc.DownloadString(StooqAddr);

                values.date = DateTime.Now;

                values.wig = GetValue(WigId);

                values.wig20 = GetValue(Wig20Id);

                values.wig20fut = GetValue(Wig20FutId);

                values.wig20usd = GetValue(Wig20UsdId);

                values.mwig40 = GetValue(MWig40Id);

                values.swig80 = GetValue(SWig80Id);
            }
            catch (WebException ex)
            {
                throw;
            }

            return values;
        }

        public void Stop(bool immediate)
        {
            this.StopRefreshingStockValues();
        }

        private string GetValue(string stockIndexId)
        {
            var match = Regex.Match(htmlOutput, @"<span id=" + stockIndexId + @">(?<val>\d*\.{0,1}\d*)<\/span>", RegexOptions.Singleline);

            return match.Groups["val"].ToString().Replace('.', ',');
        }
    }
}