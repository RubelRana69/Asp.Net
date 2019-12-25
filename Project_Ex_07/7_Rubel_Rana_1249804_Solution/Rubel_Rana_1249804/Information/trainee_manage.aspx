<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trainee_manage.aspx.cs" Inherits="Rubel_Rana_1249804.Information.trainee_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col">
            <h2>Trainees</h2>
            <div>
                <a runat="server" class="btn btn-primary" href="~/Information/trainee_add.aspx">Add New</a>
            </div>
            <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" 
                DataSourceID="dsTrainees" AutoGenerateColumns="False" DataKeyNames="trainee_id" 
                AllowPaging="True" AllowSorting="True" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="trainee_id" HeaderText="Trainee ID" ReadOnly="True" SortExpression="trainee_id" />
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
                    <asp:CommandField />
                </Columns>

            </asp:GridView>

            <asp:SqlDataSource ID="dsTrainees" runat="server" ConnectionString="<%$ ConnectionStrings:coursesDbContext %>" InsertCommand="INSERT INTO [trainees] ([trainee_id], [course_id], [trainee_name], [batch_id], [picture]) VALUES (@trainee_id, @course_id, @trainee_name, @batch_id, @picture)" SelectCommand="SELECT * FROM [trainees]">
                
                <InsertParameters>
                    <asp:Parameter Name="trainee_id" Type="Int32" />
                    <asp:Parameter Name="course_id" Type="Int32" />
                    <asp:Parameter Name="trainee_name" Type="String" />
                    <asp:Parameter Name="batch_id" Type="String" />
                    <asp:Parameter Name="picture" Type="String" />
                </InsertParameters>
                
            </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
