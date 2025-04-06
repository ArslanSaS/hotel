using System;
using System.Windows.Forms;
using hotels.Data;
using hotels.Models;

namespace YourProjectName
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
            dataGridView1.DataSource = _context.Orders.ToList();
        }

        private void btnSave_Click(object sender, EventArgs e)
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
    }
}