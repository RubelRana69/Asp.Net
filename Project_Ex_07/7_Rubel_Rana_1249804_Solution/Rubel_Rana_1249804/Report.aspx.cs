using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rubel_Rana_1249804
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet1 ds = new DataSet1();
            DataSet1TableAdapters.coursesTableAdapter da = new DataSet1TableAdapters.coursesTableAdapter();
            DataSet1.coursesDataTable dt = (DataSet1.coursesDataTable)ds.Tables["courses"];
            da.Fill(dt);
            DataSet1TableAdapters.traineesTableAdapter da1 = new DataSet1TableAdapters.traineesTableAdapter();
            DataSet1.traineesDataTable dt1 = (DataSet1.traineesDataTable)ds.Tables["trainees"];
            da1.Fill(dt1);
            CrystalReport1 rpt = new CrystalReport1();

            rpt.SetDataSource(ds);
            //rpt.Refresh();

            this.CrystalReportViewer1.ReportSource = rpt;
        }
    }
}