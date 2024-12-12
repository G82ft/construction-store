
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace ConstructionStore
{
    public static class AppData
    {
        public static Frame Frame;
        public static ConstructionStoreEntities Model;
        public static Users user;
        public static Dictionary<Products, int> cart;

        public static void Rollback()
        {
            Model.ChangeTracker.Entries().Where(x => x.State != EntityState.Unchanged).ToList().ForEach(
                x =>
                {
                    switch (x.State)
                    {
                        case EntityState.Added:
                            x.State = EntityState.Detached;
                            break;
                        case EntityState.Deleted:
                        case EntityState.Modified:                                
                            x.State = EntityState.Unchanged;
                            break;
                    }
                }
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

        public static bool AskQuestion(string message)
        {
            return MessageBox.Show(
                message,
                "Подтверждение",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question
            ) == MessageBoxResult.Yes;
        }

        public static void ShowError(string message)
        {
            MessageBox.Show(
                message,
                "Ошибка",
                MessageBoxButton.OK,
                MessageBoxImage.Error
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