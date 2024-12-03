using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;

namespace ConstructionStore.Pages
{
    public partial class Auth : Page
    {
        private bool _register;
        public Auth(bool register = true)
        {
            _register = register;
            InitializeComponent();
            role.ItemsSource = AppData.Model.Roles.ToList();
        }

        private void OnClick(object sender, RoutedEventArgs e)
        {
            Users user;
            string loginText = login.Text, pwd = password.Password; 
            if (!_register)
            {
                user = AppData.Model.Users.FirstOrDefault(x => x.Login == loginText && x.Password == pwd);
                if (user == null)
                {
                    MessageBox.Show("Неверный логин или пароль!");
                    return;
                }
                AppData.ShowInfo($"Добро пожаловать, {user.LastName} {user.FirstName} {user.Patronymic}!");
                AppData.Frame.Navigate(null);
                return;
            }

            if (!Validate()) return;
            user = new Users
            {
                Login = loginText,
                Password = pwd,
                FirstName = firstName.Text,
                LastName = lastName.Text,
                Patronymic = patronymic.Text,
                Phone = phone.Text,
                // ReSharper disable once PossibleNullReferenceException
                Role = AppData.Model.Roles.FirstOrDefault(x => x.Name == role.Text).ID
            };
            AppData.Model.Users.Add(user);
            AppData.Model.SaveChanges();
            AppData.ShowInfo("Регистрация успешна!");
            AppData.Frame.Navigate(null);
        }

        private bool Validate()
        {
            List<List<string>> fields = new List<List<string>>
            {
                new List<string> {login.Text, "Логин"},
                new List<string> {password.Password, "Пароль"},
                new List<string> {repeatPwd.Password, "Повторный ввод пароля"},
                new List<string> {firstName.Text, "Имя"},
                new List<string> {lastName.Text, "Фамилия"},
                new List<string> {patronymic.Text, "Отчество"},
                new List<string> {phone.Text, "Телефон"},
            };

            foreach (List<string> field in fields)
                if (AppData.CheckEmpty(field[0], field[1])) return false;

            if (password.Password != repeatPwd.Password)
            {
                AppData.ShowError("Пароли не совпадают!");
                return false;
            }

            if (phone.Text.Trim().Length != 11 || !long.TryParse(phone.Text, out _))
            {
                AppData.ShowError("Номер должен быть в формате 8XXXXXXXXXX (11 цифр включая 8).");
                return false;
            }

            string loginText = login.Text;
            if (AppData.Model.Users.Any(x => x.Login == loginText))
            {
                AppData.ShowError("Пользователь с таким логином уже существует!");
                return false;
            }
            
            return true;
        }
    }
}