using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rubel_Rana_1249804.Information
{
    public partial class trainee_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Insert_Click(object sender, EventArgs e)
        {
            if (!tpicture.HasFile || tpicture.PostedFile.ContentLength <= 0)
            {
                this.msg.InnerHtml = "Select at least one picture for the pad.";
                this.alert.Attributes.Add("class", "alert alert-warning");
                this.alert.Visible = true;
                return;
            }
            if (tpicture.HasFile)
            {
                if (tpicture.PostedFile.ContentLength > 0)
                {
                    tpicture.PostedFile.SaveAs(Server.MapPath("~/Images/") + tpicture.FileName);
                }
            }

            dsTrainees.InsertParameters["course_id"].DefaultValue = ddlTrainees.SelectedValue;
            dsTrainees.InsertParameters["trainee_name"].DefaultValue =trainee_name.Text;
            dsTrainees.InsertParameters["batch_id"].DefaultValue = batch_id.Text;
            dsTrainees.InsertParameters["picture"].DefaultValue = tpicture.FileName;      
            if (dsTrainees.Insert() > 0)
            {
                ddlTrainees.SelectedValue = "Select One";
                trainee_name.Text = "";
                batch_id.Text = "";

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