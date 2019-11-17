using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                DateTime localDate = DateTime.Now;

                string reportingTme = localDate.TimeOfDay.ToString("hh");
                string path = Directory.GetCurrentDirectory();
                string dtRep = localDate.Date.ToString("yyyyMMdd");
                string paramBat = dtRep + reportingTme + "00";

                Process proc = new Process();
                proc.StartInfo.WorkingDirectory = path;
                Console.WriteLine(" 1:input\n 2:output\n--------------------------------------------------------");
                int v = Convert.ToInt32(Console.ReadLine());

                if (v == 1)
                {
                    proc.StartInfo.FileName = "input.bat";
                    proc.StartInfo.Arguments = " " + paramBat;
                }

                else
                {
                    proc.StartInfo.FileName = "output.bat";
                    proc.StartInfo.Arguments = " " + paramBat;
                }

                proc.StartInfo.CreateNoWindow = false;
                proc.Start();
             
                proc.WaitForExit();
                Console.WriteLine("ok");
                Console.Read();
            }
            catch(Exception e)
            {
                Console.WriteLine("Error: "+e.Message);
            }
           
        }
    }
}
