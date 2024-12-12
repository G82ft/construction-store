using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;


namespace ConstructionStore.Pages
{
    public partial class View : Page
    {
        private readonly bool _init;
        private static readonly string defProd = "Выберите тип продукта...";
        private static readonly string defProv = "Выберите производителя...";
        private const string defOrd = "Отсортировать по цене";
        private const string ordAsc = "По возрастанию";
        private const string ordDesc = "По убыванию";
        
        public View()
        {
            InitializeComponent();
            if (AppData.user.Role == 1)
            {
                add.Visibility = Visibility.Collapsed;
            }
            List<string> items = new List<string> { defProd };
            items.AddRange(AppData.Model.ProductTypes.Select(x => x.Name));
            types.ItemsSource = items;
            types.SelectedIndex = 0;
            
            items = new List<string> { defProv };
            items.AddRange(AppData.Model.Providers.Select(x => x.Name));
            providers.ItemsSource = items;
            providers.SelectedIndex = 0;
            
            items = new List<string> { defOrd, ordAsc, ordDesc };
            orderHow.ItemsSource = items;
            orderHow.SelectedIndex = 0;
            _init = true;
            Update();
        }

        public void Update()
        {
            if (!_init) return;

            IQueryable<Products> items = AppData.Model.Products;
            if (search.Text.Trim().Length != 0)
                items = items.Where(x => x.Name.Contains(search.Text));
            
            if (types.Text != defProd)
                items = items.Where(x => x.ProductTypes.Name == types.Text);
            if (providers.Text != defProv) {
                items = items.Where(x => x.Providers.Name == providers.Text);
            }

            switch (orderHow.Text)
            {
                case ordAsc:
                    items = items.OrderBy(x => x.Price);
                    break;
                case ordDesc:
                    items = items.OrderByDescending(x => x.Price);
                    break;
            }
            
            listView.ItemsSource = items.ToList();
        }

        private void OnSearchChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void OnFilterClosed(object sender, EventArgs e)
        {
            Update();
        }

        private void Edit(object sender, MouseButtonEventArgs e)
        {
            int id = int.Parse(((sender as Grid).Children[0] as TextBlock).Text);
            AppData.Frame.Navigate(new AddEdit(AppData.Model.Products.FirstOrDefault(x => x.ID == id), false, this));
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            AppData.Frame.Navigate(new AddEdit(new Products(), true, this));
        }

        private void AddToCart(object sender, RoutedEventArgs e)
        {
            int id = int.Parse((sender as Button).Tag.ToString());
            Products key = AppData.Model.Products.FirstOrDefault(x => x.ID == id);
            AppData.cart[key] = (AppData.cart.TryGetValue(key, out var ret) ? ret : 0) + 1;
            AppData.ShowInfo($"Товар добавлен в коризну!\nТекущее количество в корзине: {AppData.cart[key]}");
        }

        private void ToCart(object sender, RoutedEventArgs e)
        {
            AppData.Frame.Navigate(new Cart());
        }

        private void ToOrders(object sender, RoutedEventArgs e)
        {
            AppData.Frame.Navigate(null);
        }
    }
}