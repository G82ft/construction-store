using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ConstructionStore.Pages
{
    /// <summary>
    /// Логика взаимодействия для Cart.xaml
    /// </summary>
    public partial class Cart : Page
    {
        public Cart()
        {
            InitializeComponent();
            listView.ItemsSource = AppData.cart.ToDictionary(x => x.Key, y => y.Value);
        }

        private void AddAmount(object sender, RoutedEventArgs e)
        {
            int id = int.Parse((sender as Button).Tag.ToString());
            Products key = AppData.Model.Products.FirstOrDefault(x => x.ID == id);
            AppData.cart[key] = AppData.cart[key] + 1;
            listView.ItemsSource = AppData.cart.ToDictionary(x => x.Key, y => y.Value);
        }

        private void SubAmount(object sender, RoutedEventArgs e)
        {
            int id = int.Parse((sender as Button).Tag.ToString());
            Products key = AppData.Model.Products.FirstOrDefault(x => x.ID == id);
            AppData.cart[key] = AppData.cart[key] - 1;
            if (AppData.cart[key] == 0)
            {
                AppData.cart.Remove(key);
            }
            listView.ItemsSource = AppData.cart.ToDictionary(x => x.Key, y => y.Value);
        }

        private void OrderFromCart(object sender, RoutedEventArgs e)
        {
            int orderID = (int)(DateTimeOffset.UtcNow.ToUnixTimeSeconds() / 1000);
            
            foreach (var item in AppData.cart)
            {
                AppData.Model.Cart.Add(
                    new ConstructionStore.Cart()
                    {
                        OrderID = orderID,
                        ProductID = item.Key.ID,
                        UserID = AppData.user.ID
                    }
                );
            }
            AppData.cart.Clear();
            listView.ItemsSource = AppData.cart.ToDictionary(x => x.Key, y => y.Value);
            AppData.ShowInfo("Заказ оформлен!");
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            AppData.Frame.GoBack();
        }
    }
}