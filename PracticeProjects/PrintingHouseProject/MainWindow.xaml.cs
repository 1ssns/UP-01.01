using iTextSharp.text;
using iTextSharp.text.pdf;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using static Microsoft.IO.RecyclableMemoryStreamManager;

namespace PrintingHouseProject
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            sorting.SelectedIndex = 0;
            filter.SelectedIndex = 0;
            LoadData();
            AddingSortingBoxItems();
        }

        private void LoadData()
        {
            using(var context = new PleasantRustleEntities())
            {
                var allagents = context.Agents.ToList();
                var agents = allagents.Where(a => a.AgentName.ToLower().Contains(search.Text.ToLower()) ||
                                         a.Phone.ToLower().Contains(search.Text.ToLower())).ToList();
                var types = allagents.Select(a => a.AgentType).ToList();
                types.Insert(0, "Все типы");
                filter.ItemsSource = types.Distinct();
                if (filter.SelectedIndex > 0)
                {
                    string selectedType = filter.SelectedItem as string;
                    agents = agents.Where(a => a.AgentType == selectedType).ToList();
                }
                if (sorting.SelectedIndex == 1)
                {
                    if (descendingSorting.IsChecked == true)
                        agents = agents.OrderByDescending(a => a.Priority).ToList();
                    else
                        agents = agents.OrderBy(a => a.Priority).ToList();
                }

                List<SummaryData> allData = new List<SummaryData>();

                foreach (var agent in agents)
                {
                    DateTime oneYearAgo = DateTime.Now.AddYears(-1);
                    int salesForLastYear = agent.ProductSales
                                                .Where(s => s.SaleDate >= oneYearAgo)
                                                .Sum(s => s.Quantity) ?? 0;
                    int totalQuantity = agent.ProductSales
                                             .Where(s => s.SaleDate >= oneYearAgo)
                                             .Sum(s => s.Quantity) ?? 0;
                    int discountPercent = GetDiscountPercent(totalQuantity);
                    allData.Add(new SummaryData
                    {
                        AgentID = agent.AgentID,
                        Logo = agent.Logo,
                        AgentType = agent.AgentType,
                        AgentName = agent.AgentName,
                        SalesForLastYear = salesForLastYear.ToString(),
                        Phone = agent.Phone,
                        Email = agent.Email,
                        Priority = agent.Priority,
                        DiscountPercent = discountPercent
                    });

                }

                itemsControl.ItemsSource = allData;
            }
        }

        private int GetDiscountPercent(int totalQuantity)
        {
            var discountInterval = new[]
            {
        new { MinQuantity = 0, MaxQuantity = 10, DiscountPercent = 0 },
        new { MinQuantity = 10, MaxQuantity = 50, DiscountPercent = 5 },
        new { MinQuantity = 50, MaxQuantity = 150, DiscountPercent = 10 },
        new { MinQuantity = 150, MaxQuantity = 500, DiscountPercent = 20 },
        new { MinQuantity = 500, MaxQuantity = int.MaxValue, DiscountPercent = 25 }
    };
            var interval = discountInterval.FirstOrDefault(i => totalQuantity >= i.MinQuantity && totalQuantity < i.MaxQuantity);
            return interval?.DiscountPercent ?? 0;
        }

        private void AddingSortingBoxItems()
        {
            sorting.Items.Add("Без сортировки");
            sorting.Items.Add("По приоритетности");
            sorting.Items.Add("По размеру скидки");
        }

        private void filter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadData();
        }

        private void search_TextChanged(object sender, TextChangedEventArgs e)
        {
            LoadData();
        }

        private void sorting_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadData();
        }

        private void descendingSorting_Checked(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void descendingSorting_Unchecked(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void addAgentButton_Click(object sender, RoutedEventArgs e)
        {
            CreateNewAgentWindow window = new CreateNewAgentWindow(null);
            window.ShowDialog();
            using (var context = new PleasantRustleEntities())
            {
                List<SummaryData> allData = new List<SummaryData>();

                foreach (var agent in context.Agents)
                {
                    DateTime oneYearAgo = DateTime.Now.AddYears(-1);
                    int salesForLastYear = agent.ProductSales
                                                .Where(s => s.SaleDate >= oneYearAgo)
                                                .Sum(s => s.Quantity) ?? 0;
                    int totalQuantity = agent.ProductSales
                                             .Where(s => s.SaleDate >= oneYearAgo)
                                             .Sum(s => s.Quantity) ?? 0;
                    int discountPercent = GetDiscountPercent(totalQuantity);
                    allData.Add(new SummaryData
                    {
                        AgentID = agent.AgentID,
                        Logo = agent.Logo,
                        AgentType = agent.AgentType,
                        AgentName = agent.AgentName,
                        SalesForLastYear = salesForLastYear.ToString(),
                        Phone = agent.Phone,
                        Email = agent.Email,
                        Priority = agent.Priority,
                        DiscountPercent = discountPercent
                    });

                }

                itemsControl.ItemsSource = allData;
            }
        }

        private void editButton_Click(object sender, RoutedEventArgs e)
        {
            using (var context = new PleasantRustleEntities())
            {
                SummaryData editData = (sender as Button).DataContext as SummaryData;

                var editAgent = context.Agents.First(a => a.AgentID == editData.AgentID);
                CreateNewAgentWindow window = new CreateNewAgentWindow(editAgent);
                window.ShowDialog();
                List<SummaryData> allData = new List<SummaryData>();

                foreach (var agent in context.Agents)
                {
                    DateTime oneYearAgo = DateTime.Now.AddYears(-1);
                    int salesForLastYear = agent.ProductSales
                                                .Where(s => s.SaleDate >= oneYearAgo)
                                                .Sum(s => s.Quantity) ?? 0;
                    int totalQuantity = agent.ProductSales
                                             .Where(s => s.SaleDate >= oneYearAgo)
                                             .Sum(s => s.Quantity) ?? 0;
                    int discountPercent = GetDiscountPercent(totalQuantity);
                    allData.Add(new SummaryData
                    {
                        AgentID = agent.AgentID,
                        Logo = agent.Logo,
                        AgentType = agent.AgentType,
                        AgentName = agent.AgentName,
                        SalesForLastYear = salesForLastYear.ToString(),
                        Phone = agent.Phone,
                        Email = agent.Email,
                        Priority = agent.Priority,
                        DiscountPercent = discountPercent
                    });

                }

                itemsControl.ItemsSource = allData;
            }
        }

        private void deleteButton_Click(object sender, RoutedEventArgs e)
        {
            var agent = (SummaryData)((Button)sender).DataContext;

            if (MessageBox.Show("Вы точно хотите удалить этого агента?", "Удаление агента",
                MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes)
            {
                try
                {
                    using (var context = new PleasantRustleEntities())
                    {
                        int agentId = agent.AgentID;

                        var soldItems = context.ProductSales.Where(sp => sp.AgentID == agentId);
                        context.ProductSales.RemoveRange(soldItems);

                        Agents agentForRemove = context.Agents.Find(agentId);
                        context.Agents.Remove(agentForRemove);

                        List<SummaryData> allData = new List<SummaryData>();

                        foreach (var agents in context.Agents)
                        {
                            DateTime oneYearAgo = DateTime.Now.AddYears(-1);
                            int salesForLastYear = agents.ProductSales
                                                        .Where(s => s.SaleDate >= oneYearAgo)
                                                        .Sum(s => s.Quantity) ?? 0;
                            int totalQuantity = agents.ProductSales
                                                     .Where(s => s.SaleDate >= oneYearAgo)
                                                     .Sum(s => s.Quantity) ?? 0;
                            int discountPercent = GetDiscountPercent(totalQuantity);
                            allData.Add(new SummaryData
                            {
                                AgentID = agents.AgentID,
                                Logo = agents.Logo,
                                AgentType = agents.AgentType,
                                AgentName = agents.AgentName,
                                SalesForLastYear = salesForLastYear.ToString(),
                                Phone = agents.Phone,
                                Email = agents.Email,
                                Priority = agents.Priority,
                                DiscountPercent = discountPercent
                            });

                        }

                        itemsControl.ItemsSource = allData;

                        context.SaveChanges();
                        MessageBox.Show("Записи успешно удалены!");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }

    public class SummaryData
    {
        public int AgentID { get; set; }
        public string Logo { get; set; }
        public string AgentType { get; set; }
        public string AgentName { get; set; }
        public string SalesForLastYear { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int? Priority { get; set; }
        public int? DiscountPercent { get; set; }
    }
}
