using ConstructionStore;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;

namespace UnitTests
{
    /// <summary>
    /// Сводное описание для TestImages
    /// </summary>
    [TestClass]
    public class TestImages
    {
        [TestMethod]
        public void TestMethod1()
        {
            // Arrange
            string testPath = "test.png";
            string expected = $"../../Images/{testPath}";
            Images image = new Images()
            {
                Path = testPath
            };
            // Act
            string actual = image.ImagePath;
            // Assert
            Assert.AreEqual(expected, actual);
        }
    }
}
