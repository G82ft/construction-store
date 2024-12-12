using ConstructionStore;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;

namespace UnitTests
{
    [TestClass]
    public class TestEmpty
    {
        [TestMethod]
        public void TestCheckEmpty()
        {
            // Arrange
            string test = string.Empty;
            // Act
            bool result = AppData.CheckEmpty(test, "Empty");
            // Assert
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void TestCheckNotEmpty()
        {
            // Arrange
            string test = "test";
            // Act
            bool result = AppData.CheckEmpty(test, "NotEmpty");
            // Assert
            Assert.IsFalse(result);
        }
    }
}
