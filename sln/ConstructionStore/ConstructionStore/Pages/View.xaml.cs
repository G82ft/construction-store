using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Controls;

namespace ConstructionStore.Pages
{
    public partial class View : Page
    {
        private readonly bool _init = false;
        private static readonly string defProd = "Выберите тип продукта...";
        private static readonly string defProv = "Выберите производителя...";
        private const string defOrd = "Отсортировать по цене";
        private const string ordAsc = "По возрастанию";
        private const string ordDesc = "По убыванию";
        
        public View()
        {
            InitializeComponent();
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

        void Update()
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
    }
}