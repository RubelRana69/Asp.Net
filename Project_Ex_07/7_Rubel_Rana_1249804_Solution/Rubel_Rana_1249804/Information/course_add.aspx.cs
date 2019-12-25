using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rubel_Rana_1249804.Information
{
    public partial class course_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Insert_Click(object sender, EventArgs e)
        {
            dsCourses.InsertParameters["Course_Name"].DefaultValue = course_name.Text;
            dsCourses.InsertParameters["Course_duration"].DefaultValue = course_duration.Text;
            if (dsCourses.Insert() > 0)
            {
                course_name.Text = "";
                course_duration.Text = "";
                this.msg.InnerHtml = "Data Inserted.";
                this.alert.Attributes.Add("class", "alert alert-success");
                this.alert.Visible = true;
            }
            else
            {
                this.msg.InnerHtml = "Operation failled.";
                this.alert.Attributes.Add("class", "alert alert-warning.");
                this.alert.Visible = true;
            }
        }
    }
}