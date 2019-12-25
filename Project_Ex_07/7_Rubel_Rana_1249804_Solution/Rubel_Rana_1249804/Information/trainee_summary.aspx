<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trainee_summary.aspx.cs" Inherits="Rubel_Rana_1249804.Information.trainee_summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col">
            <h2>Trainee Details</h2>
            <div class="card">
                <h3>Courses</h3>
                <asp:GridView ID="dgCourses" CssClass="table table-bordered table-striped" runat="server" PagerStyle-CssClass="alert-success" SelectedIndex="0" AutoGenerateColumns="False" DataKeyNames="course_id" DataSourceID="dsCourses" AllowPaging="True" PageSize="5" OnSelectedIndexChanged="dgCourses_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="course_id" HeaderText="Course ID" InsertVisible="False" ReadOnly="True" SortExpression="course_id" />
                        <asp:BoundField DataField="course_name" HeaderText="Course Name" SortExpression="course_name" />
                        <asp:BoundField DataField="course_duration" HeaderText="Course Duration" SortExpression="course_duration" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="dsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:coursesDbContext %>" SelectCommand="SELECT * FROM [courses]"></asp:SqlDataSource>
            </div>
             <div class="card">
                <h3>Trainees</h3>
                <asp:GridView CssClass="table table-bordered" ID="dgTrainees" runat="server" AutoGenerateColumns="False" DataKeyNames="trainee_id" DataSourceID="dsTrainees" AllowPaging="True" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="trainee_id" HeaderText="Trainee ID" InsertVisible="False" ReadOnly="True" SortExpression="trainee_id" />
                        <asp:BoundField DataField="course_id" HeaderText="Course ID" SortExpression="course_id" />
                        <asp:BoundField DataField="trainee_name" HeaderText="Trainee Name" SortExpression="trainee_name" />
                        <asp:BoundField DataField="batch_id" HeaderText="Batch ID" SortExpression="batch_id" />
                        <asp:TemplateField HeaderText="Picture" SortExpression="picture">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <img width="40" src="<%#Eval("picture","/Images/{0}") %>" alt="" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    
                 </asp:GridView>
                 <asp:SqlDataSource ID="dsTrainees" runat="server" ConnectionString="<%$ ConnectionStrings:coursesDbContext %>" SelectCommand="SELECT * FROM [trainees] WHERE ([course_id] = @course_id)">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="dgCourses" Name="course_id" PropertyName="SelectedValue" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
