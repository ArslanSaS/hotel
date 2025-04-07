using System;
using System.Linq;
using System.Windows.Forms;
using hotels.Data;
using hotels.Models;

namespace hotels
{
    public partial class MainForm : Form
    {
        private readonly OrderDBContext _context;

        public MainForm()
        {
            InitializeComponent();
            _context = new OrderDBContext();
            LoadData();
        }

        private void LoadData()
        {
            // Добавьте проверку на null
            if (dataGridView1 != null)
            {
                dataGridView1.DataSource = _context.Orders.ToList();
            }
        }

        

        // Добавьте этот метод, если Designer.cs ссылается на него
        private void MainForm_Load(object sender, EventArgs e)
        {
            // Пустая реализация или ваша логика загрузки
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void txtOrderId_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtBookingId_TextChanged(object sender, EventArgs e)
        {

        }

        private void BtnSave_Click_Click(object sender, EventArgs e)
        {

        }

        private void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var order = new Order
                {
                    order_id = int.Parse(txtOrderId.Text),
                    booking_id = int.Parse(txtBookingId.Text),
                    // ... остальные поля
                };

                _context.Orders.Add(order);
                _context.SaveChanges();
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
            }
        }
        
    }
}