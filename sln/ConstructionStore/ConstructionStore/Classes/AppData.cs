
using System.Windows;
using System.Windows.Controls;

namespace ConstructionStore
{
    public static class AppData
    {
        public static Frame Frame;
        public static ConstructionStoreEntities Model;

        public static void ShowError(string message)
        {
            MessageBox.Show(
                message,
                "Ошибка",
                MessageBoxButton.OK,
                MessageBoxImage.Error
            );
        }

        public static void ShowInfo(string message)
        {
            MessageBox.Show(
                message,
                "Информация",
                MessageBoxButton.OK,
                MessageBoxImage.Information
            );
        }
        
        public static bool CheckEmpty(string text, string name)
        {
            if (!string.IsNullOrEmpty(text)) return false;
            
            AppData.ShowError($"{name} не может быть пустым!");
            return true;
        }
    }
}