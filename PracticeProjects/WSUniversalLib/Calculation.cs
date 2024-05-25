using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WSUniversalLib
{
    public class Calculation
    {
        static public int GetQuantityForProduct(int productType, int materialType, int count, decimal width, decimal length)
        {
            decimal productCoefficient;
            switch (productType)
            {
                case 1:
                    productCoefficient = 1.1m;
                    break;
                case 2:
                    productCoefficient = 2.5m;
                    break;
                case 3:
                    productCoefficient = 8.43m;
                    break;
                default:
                    return -1;
            }

            decimal materialWastePercent;
            switch (materialType)
            {
                case 1:
                    materialWastePercent = 0.3m;
                    break;
                case 2:
                    materialWastePercent = 0.12m;
                    break;
                default:
                    return -1;
            }

            decimal area = width * length;

            decimal rawMaterialWithoutWaste = area * productCoefficient;

            decimal rawMaterialWithWaste = rawMaterialWithoutWaste * (1 + materialWastePercent / 100);

            int requiredRawMaterial = (int)Math.Ceiling(rawMaterialWithWaste);

            int totalRequiredRawMaterial = requiredRawMaterial * count;

            return totalRequiredRawMaterial;
        }
    }
}
