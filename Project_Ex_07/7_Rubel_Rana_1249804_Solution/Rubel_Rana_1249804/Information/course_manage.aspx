<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="course_manage.aspx.cs" Inherits="Rubel_Rana_1249804.Information.course_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>Courses</h2>
            <div class="d-flex justify-content-end mb-1">
                <a runat="server" class="btn btn-primary btn-sm" href="~/Information/course_add.aspx"><i class="fa fa-plus"></i>Add New</a>
            </div>
            <asp:GridView CssClass="table table-bordered table-striped" ID="dgcourses" runat="server" AutoGenerateColumns="False" DataKeyNames="course_id" DataSourceID="dsCourses" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" InsertVisible="False" ReadOnly="True" SortExpression="course_id" />
                    <asp:BoundField DataField="course_name" HeaderText="Course Name" SortExpression="course_name" />
                    <asp:BoundField DataField="course_duration" HeaderText="Course Duration" SortExpression="course_duration" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>

                <EmptyDataTemplate>
                    <div class="alert alert-info">
                        <p>No record found</p>
                    </div>
                </EmptyDataTemplate>

            </asp:GridView>
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
