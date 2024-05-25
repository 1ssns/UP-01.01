using Microsoft.Win32;
using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows;

namespace PrintingHouseProject
{
    /// <summary>
    /// Логика взаимодействия для CreateNewAgentWindow.xaml
    /// </summary>
    public partial class CreateNewAgentWindow : Window
    {
        private string _logotypePath;
        private Agents _currentAgent = new Agents();
        public CreateNewAgentWindow(Agents selectedAgent)
        {
            InitializeComponent();
            if (selectedAgent != null)
            {
                _currentAgent = selectedAgent;
                _logotypePath = selectedAgent.Logo;
            }    
            DataContext = _currentAgent;
        }

        private void logotypeAddingButton_Click(object sender, RoutedEventArgs e)
        {
            string projectFolderPath = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName;
            string targetFolderPath = System.IO.Path.Combine(projectFolderPath, "bin", "Debug", "Resources", "Logotypes");
            Directory.CreateDirectory(targetFolderPath);
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Изображения (*.jpg, *.jpeg, *.png)|*.jpg;*.jpeg;*.png|Все файлы (*.*)|*.*";
            bool? result = openFileDialog.ShowDialog();
            if (result == true)
            {
                string sourceFilePath = openFileDialog.FileName;
                string fileName = System.IO.Path.GetFileName(sourceFilePath);
                string targetFilePath = System.IO.Path.Combine(targetFolderPath, fileName);
                string targetFullPath = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, targetFilePath);
                File.Copy(sourceFilePath, targetFullPath, true);
                _logotypePath = "//agents//" + fileName;
                MessageBox.Show($"Файл {sourceFilePath} выбран успешно!");
            }
        }

        private StringBuilder ValidateFields()
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrEmpty(nameAgentBox.Text))
                errors.AppendLine("Вы не указали название!");
            if (string.IsNullOrEmpty(typeAgentBox.Text))
                errors.AppendLine("Вы не указали тип агента!");
            if (string.IsNullOrEmpty(priorityAgentBox.Text))
                errors.AppendLine("Вы не указали приоритет агента!");
            string input = priorityAgentBox.Text;
            bool isNumeric = int.TryParse(input, out _);
            if (!isNumeric)
                errors.AppendLine("Указан некорректный приоритет!");
            if (string.IsNullOrEmpty(adressAgentBox.Text))
                errors.AppendLine("Вы не указали юридический адрес агента!");
            if (string.IsNullOrEmpty(innAgentBox.Text))
                errors.AppendLine("Вы не указали ИНН агента!");
            input = innAgentBox.Text;
            isNumeric = int.TryParse(input, out _);
            //if (!isNumeric)
            //    errors.AppendLine("Указан некорректный ИНН!");
            if (string.IsNullOrEmpty(kppAgentBox.Text))
                errors.AppendLine("Вы не указали КПП агента!");
            input = kppAgentBox.Text;
            isNumeric = int.TryParse(input, out _);
            if (!isNumeric)
                errors.AppendLine("Указан некорректный КПП!");
            if (string.IsNullOrEmpty(directorAgentBox.Text))
                errors.AppendLine("Вы не указали ФИО директора!");
            if (string.IsNullOrEmpty(telAgentBox.Text))
                errors.AppendLine("Вы не указали телефон агента!");
            input = telAgentBox.Text;
            //isNumeric = Regex.IsMatch(input, @"^\d+$");
            //if (!isNumeric)
            //    errors.AppendLine("Указан некорректный телефон!");
            //if (telAgentBox.Text.Length > 11 || telAgentBox.Text.Length < 11)
            //    errors.AppendLine("Указан некорректный телефон!");
            if (string.IsNullOrEmpty(emailAgentBox.Text))
                errors.AppendLine("Вы не указали почту агента!");
            return errors;
        }

        private void saveChangesButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = ValidateFields();
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            else
            {
                try
                {
                    using (var context = new PleasantRustleEntities())
                    {
                        Agents agent = context.Agents.Find(_currentAgent.AgentID);

                        if (agent == null)
                        {
                            var newAgent = new Agents
                            {
                                AgentName = nameAgentBox.Text,
                                AgentType = typeAgentBox.Text,
                                Priority = Convert.ToInt32(priorityAgentBox.Text),
                                LegalAddress = adressAgentBox.Text,
                                INN = innAgentBox.Text,
                                KPP = kppAgentBox.Text,
                                Director = directorAgentBox.Text,
                                Phone = telAgentBox.Text,
                                Email = emailAgentBox.Text,
                                Logo = _logotypePath
                            };
                            context.Agents.Add(newAgent);
                            context.SaveChanges();
                            MessageBox.Show("Данные сохранены!");
                        }
                        else
                        {
                            agent.AgentName = nameAgentBox.Text;
                            agent.AgentType = typeAgentBox.Text;
                            agent.Priority = Convert.ToInt32(priorityAgentBox.Text);
                            agent.LegalAddress = adressAgentBox.Text;
                            agent.INN = innAgentBox.Text;
                            agent.KPP = kppAgentBox.Text;
                            agent.Director = directorAgentBox.Text;
                            agent.Phone = telAgentBox.Text;
                            agent.Email = emailAgentBox.Text;
                            agent.Logo = _logotypePath;
                            context.SaveChanges();
                            MessageBox.Show("Данные обновлены!");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
    }
}
