<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="trainee_add.aspx.cs" Inherits="Rubel_Rana_1249804.Information.trainee_add" %>
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
                        </button>
                        <p runat="server" id="msg"></p>
                    </div>
                     <div class="form-group row">
                        <asp:Label ID="Label4" CssClass="col-form-label col-md-2" AssociatedControlID="ddlTrainees" runat="server" Text="Course Name:"></asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="ddlTrainees" AppendDataBoundItems="True" DataSourceID="dsCourses" runat="server" DataTextField="course_name" DataValueField="course_id">
                                <asp:ListItem Selected="True">Select One</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="Select One" ControlToValidate="ddlTrainees" ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="Course name must be required!"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label1" CssClass="col-form-label col-md-2" AssociatedControlID="trainee_name" runat="server" Text="Trainee Name:"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox CssClass="form-control form-control-sm col-md-2" ID="trainee_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="trainee_name" ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Trainee name must be required!"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label2" CssClass="col-form-label col-md-2" AssociatedControlID="batch_id" runat="server" Text="Batch ID:"></asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox CssClass="form-control form-control-sm col-md-2" ID="batch_id" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ControlToValidate="batch_id" ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Batch-ID must be required!"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <asp:Label ID="Label3" CssClass="col-form-label col-md-2" AssociatedControlID="tpicture" runat="server" Text="Picture:"></asp:Label>
                        <div class="col-md-10">
                            <asp:FileUpload  ID="tpicture" CssClass="form-control-file form-control-sm btn btn-sm"  runat="server" />       
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
                    <asp:SqlDataSource ID="dsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:coursesDbContext %>" SelectCommand="SELECT [course_id], [course_name] FROM [courses]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsTrainees" runat="server" ConnectionString="<%$ ConnectionStrings:coursesDbContext %>"  InsertCommand="INSERT INTO [trainees] ([course_id], [trainee_name], [batch_id], [picture]) VALUES (@course_id, @trainee_name, @batch_id, @picture)" SelectCommand="SELECT * FROM [trainees]" DeleteCommand="DELETE FROM [trainees] WHERE [trainee_id] = @trainee_id" UpdateCommand="UPDATE [trainees] SET [course_id] = @course_id, [trainee_name] = @trainee_name, [batch_id] = @batch_id, [picture] = @picture WHERE [trainee_id] = @trainee_id" >

                        <DeleteParameters>
                            <asp:Parameter Name="trainee_id" Type="Int32" />
                        </DeleteParameters>

                        <InsertParameters>
                            <asp:Parameter Name="course_id" Type="Int32" />
                            <asp:Parameter Name="trainee_name" Type="String" />
                            <asp:Parameter Name="batch_id" Type="String" />
                            <asp:Parameter Name="picture" Type="String" />
                        </InsertParameters>

                        <UpdateParameters>
                            <asp:Parameter Name="course_id" Type="Int32" />
                            <asp:Parameter Name="trainee_name" Type="String" />
                            <asp:Parameter Name="batch_id" Type="String" />
                            <asp:Parameter Name="picture" Type="String" />
                            <asp:Parameter Name="trainee_id" Type="Int32" />
                        </UpdateParameters>

                    </asp:SqlDataSource>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="Insert" />
                </Triggers>
            </asp:UpdatePanel>
            <a runat ="server" href="~/Information/trainee_manage.aspx"><i class="fa fa-long-arrow-left"></i>Back to List</a>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
