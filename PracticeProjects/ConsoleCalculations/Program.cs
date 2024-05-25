using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WSUniversalLib;

namespace ConsoleCalculations
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(Calculation.GetQuantityForProduct(3, 1, 15, 20, 45));
        }
    }
}
