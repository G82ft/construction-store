using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace ConstructionStore.Pages
{
    public partial class AddEdit : Page
    {
        public Products product { get; set; }
        public List<ProductTypes> types { get; set; }
        public List<Providers> providers { get; set; }
        public List<Images> images { get; set; }
        private bool _new;
        private View _parent;
        public AddEdit(Products product, bool _new, View parent)
        {
            this.product = product;
            this._new = _new;
            this._parent = parent;
            types = AppData.Model.ProductTypes.ToList();
            providers = AppData.Model.Providers.ToList();
            images = AppData.Model.Images.ToList();
            
            InitializeComponent();
            if (_new)
            {
                product.Type = 1;
                product.Provider = 1;
                product.Image = 1;
            }
            if (_new || AppData.user.Role != 3)
                delete.Visibility = Visibility.Collapsed;
            
            DataContext = this;
        }

        private void Save(object sender, System.Windows.RoutedEventArgs e)
        {
            if (name.Text.Equals("") || price.Text.Equals("") || amount.Text.Equals(""))
            {
                AppData.ShowError("Все поля должны быть заполнены!");
                return;
            }

            if (product.Price.ToString(CultureInfo.InvariantCulture) != price.Text ||
                product.EachPackAmount.ToString(CultureInfo.InvariantCulture) != amount.Text
                || price.Text.Contains('-') || amount.Text.Contains('-'))
            {
                AppData.ShowError("Неверный формат данных!\n" +
                                  "Количество в упаковке должно являться положительным числом, цена также должна иметь две цифрами после запятой");
                return;
            }
            
            if (_new)
                AppData.Model.Products.Add(product);
            
            AppData.Model.SaveChanges();
            AppData.ShowInfo("Изменения сохранены!");
            Quit();
        }

        private void Cancel(object sender, RoutedEventArgs e)
        {
            if (AppData.AskQuestion("Все несохранённые данные будут потеряны!\nВы действительно хотите вернуться?"))
            {
                AppData.Rollback();
                Quit();
            }
        }

        private void Delete(object sender, RoutedEventArgs e)
        {
            if (AppData.AskQuestion("Вы уверены, что хотите удалить данный товар?"))
            {
                AppData.Model.Products.Remove(product);
                Quit();
            }
        }

        private void Quit()
        {
            AppData.Model.SaveChanges();
            AppData.Frame.GoBack();
            _parent.Update();
        }
    }
}