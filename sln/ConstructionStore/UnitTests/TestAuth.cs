using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;
using ConstructionStore;
using ConstructionStore.Pages;
using System.Windows;
using System.Windows.Controls;
using System.Security.Principal;

namespace UnitTests
{
    /// <summary>
    /// Сводное описание для TestAuth
    /// </summary>
    [TestClass]
    public class TestAuth
    {
        public TestAuth()
        {
            //
            // TODO: добавьте здесь логику конструктора
            //
        }

        private TestContext testContextInstance;

        /// <summary>
        ///Получает или устанавливает контекст теста, в котором предоставляются
        ///сведения о текущем тестовом запуске и обеспечивается его функциональность.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        [TestMethod]
        public void TestRegisterToggleTrue()
        {
            // Arrange
            Auth auth = new Auth(register: true, true);
            // Act
            auth.register = true;
            // Assert
            Assert.AreEqual(Auth.signUp, auth.ConfirmButton.Content);
        }

        [TestMethod]
        public void TestRegisterToggleFalse()
        {
            // Arrange
            Frame frame = new Frame();
            Auth auth = new Auth(register: true, true);
            frame.Navigate(auth);
            // Act
            auth.register = false;
            // Assert
            Assert.AreEqual(Auth.signIn, auth.ConfirmButton.Content);
        }

        [TestMethod]
        public void TestAuthorize()
        {
            // Arrange
            Users users = new Users()
            {
                Login = "test",
                Password = "test",
                FirstName = "test",
                LastName = "test",
                Patronymic = "test",
                Phone = "test",
                Role = 1
            };

            Auth auth = new Auth(register: true, true);

            // Act
            bool result = auth.Authorize("test", "test");

            // Assert
            Assert.IsTrue(result);
        }
    }
}
