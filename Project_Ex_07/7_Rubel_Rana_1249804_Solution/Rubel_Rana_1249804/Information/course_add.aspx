<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="course_add.aspx.cs" Inherits="Rubel_Rana_1249804.Information.course_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <h2>Add New Course</h2>
                    <div runat="server" class="alert" id="alert" visible="false">
                        <button type="button" class="Close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>\
                        <p runat="server" id="msg"></p>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label1" CssClass="col-form-label col-md-2" AssociatedControlID="course_name" runat="server" Text="Course Name"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox CssClass="form-control form-control-sm col-md-2" ID="course_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="course_name" ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Course name must be required!"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label2" CssClass="col-form-label col-md-2" AssociatedControlID="course_duration" runat="server" Text="Course Duration"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox CssClass="form-control form-control-sm col-md-2" ID="course_duration" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="course_duration" ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Course duration must be required!"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                       <div class="col-md-2 text-right pr-1 pt-2">
                           <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                               <ProgressTemplate>
                                   <i class="fa fa-spin fa-spinner fa-2x"></i>
                               </ProgressTemplate>
                           </asp:UpdateProgress>
                           <div class="col-md-10">
                               <asp:Button CssClass="btn btn-primary" ID="Insert" runat="server" Text="Add to Database" OnClick="Insert_Click" />
                           </div>
                       </div>
                    </div>
                    <asp:SqlDataSource ID="dsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:coursesDbContext %>" DeleteCommand="DELETE FROM [courses] WHERE [course_id] = @course_id" InsertCommand="INSERT INTO [courses] ([course_name], [course_duration]) VALUES (@course_name, @course_duration)" SelectCommand="SELECT * FROM [courses]" UpdateCommand="UPDATE [courses] SET [course_name] = @course_name, [course_duration] = @course_duration WHERE [course_id] = @course_id">
                        <DeleteParameters>
                            <asp:Parameter Name="course_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="course_name" Type="String" />
                            <asp:Parameter Name="course_duration" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="course_name" Type="String" />
                            <asp:Parameter Name="course_duration" Type="String" />
                            <asp:Parameter Name="course_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            <a runat ="server" href="~/Information/course_manage.aspx"><i class="fa fa-long-arrow-left"></i>Back to List</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
