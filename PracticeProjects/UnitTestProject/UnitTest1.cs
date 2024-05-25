using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using WSUniversalLib;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void GetQuantityForProduct_NonExistingProduct_ReturnsNegativeOne()
        {
            // Arrange
            int productType = 5;
            int materialType = 1;
            int count = 10;
            decimal width = 15;
            decimal length = 30;
            int expectedQuantity = -1;

            // Act
            int actualQuantity = Calculation.GetQuantityForProduct(productType, materialType, count, width, length);

            // Assert
            Assert.AreEqual(expectedQuantity, actualQuantity);
        }

        [TestMethod]
        public void GetQuantityForProduct_NonExistingMaterial_ReturnsNegativeOne()
        {
            // Arrange
            int productType = 2;
            int materialType = 3;
            int count = 8;
            decimal width = 25;
            decimal length = 40;
            int expectedQuantity = -1;

            // Act
            int actualQuantity = Calculation.GetQuantityForProduct(productType, materialType, count, width, length);

            // Assert
            Assert.AreEqual(expectedQuantity, actualQuantity);
        }

        [TestMethod]
        public void GetQuantityForProduct_ZeroWidth_ReturnsZero()
        {
            // Arrange
            int productType = 2;
            int materialType = 2;
            int count = 4;
            decimal width = 0;
            decimal length = 15;
            int expectedQuantity = 0;

            // Act
            int actualQuantity = Calculation.GetQuantityForProduct(productType, materialType, count, width, length);

            // Assert
            Assert.AreEqual(expectedQuantity, actualQuantity);
        }

        [TestMethod]
        public void GetQuantityForProduct_ZeroArea_ReturnsZero()
        {
            // Arrange
            int productType = 1;
            int materialType = 2;
            int count = 4;
            decimal width = 0;
            decimal length = 0;
            int expectedQuantity = 0;

            // Act
            int actualQuantity = Calculation.GetQuantityForProduct(productType, materialType, count, width, length);

            // Assert
            Assert.AreEqual(expectedQuantity, actualQuantity);
        }

        [TestMethod]
        public void GetQuantityForProduct_WithValidData_ShouldCalculateCorrectQuantity()
        {
            // Arrange
            int productType = 1;
            int materialType = 1;
            int count = 5;
            decimal width = 10m;
            decimal length = 20m;
            int expectedQuantity = 330; // Expected result: (10 * 20 * 1.1) * 1.003 = 330

            // Act
            int actualQuantity = Calculation.GetQuantityForProduct(productType, materialType, count, width, length);

            // Assert
            Assert.AreEqual(expectedQuantity, actualQuantity);
        }
    }
}
