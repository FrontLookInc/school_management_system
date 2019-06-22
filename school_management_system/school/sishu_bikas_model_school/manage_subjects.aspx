<%@ Page Title="" Language="C#" MasterPageFile="~/school/sishu_bikas_model_school/sishubikash_logged_in.Master" AutoEventWireup="true" CodeBehind="manage_subjects.aspx.cs" Inherits="School_Management_System.school.sishu_bikas_model_school.manage_subjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sishubikashdb %>" DeleteCommand="DELETE FROM [subjects] WHERE [subject_code] = @subject_code" InsertCommand="INSERT INTO [subjects] ([subject_code], [subject_name], [written], [oral], [practical], [update_time], [updated_by]) VALUES (@subject_code, @subject_name, @written, @oral, @practical, @update_time, @updated_by)" SelectCommand="SELECT * FROM [subjects] ORDER BY [subject_code], [subject_name]" UpdateCommand="UPDATE [subjects] SET [subject_name] = @subject_name, [written] = @written, [oral] = @oral, [practical] = @practical, [update_time] = @update_time, [updated_by] = @updated_by WHERE [subject_code] = @subject_code">
                    <DeleteParameters>
                        <asp:Parameter Name="subject_code" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="subject_code" Type="String" />
                        <asp:Parameter Name="subject_name" Type="String" />
                        <asp:Parameter Name="written" Type="Int32" />
                        <asp:Parameter Name="oral" Type="Int32" />
                        <asp:Parameter Name="practical" Type="Int32" />
                        <asp:Parameter Name="update_time" Type="DateTime" />
                        <asp:Parameter Name="updated_by" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="subject_name" Type="String" />
                        <asp:Parameter Name="written" Type="Int32" />
                        <asp:Parameter Name="oral" Type="Int32" />
                        <asp:Parameter Name="practical" Type="Int32" />
                        <asp:Parameter Name="update_time" Type="DateTime" />
                        <asp:Parameter Name="updated_by" Type="String" />
                        <asp:Parameter Name="subject_code" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>-->
    <asp:Panel runat="server" Width="100%">
        <div style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:500">
            <h1 style="text-align:center; text-anchor:middle; font-size:1.8em; font-weight:800"">Manage Subjects</h1>
            <br />
            <asp:Panel runat="server" HorizontalAlign="Center" Width="100%">
                <asp:Button ID="add_subject" runat="server" Style="z-index: 1; top: 0px; position: relative; left: -26px;" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="New Subject" BorderColor="#0066FF" OnClick="add_subject_Click" TabIndex="1" />
                <asp:Button ID="edit_subject" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 24px;" BorderStyle="Solid" BackColor="#00CC00" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Edit Subject" BorderColor="#00CC00" OnClick="edit_subject_Click" TabIndex="2" />
<!--                <asp:Button ID="delete_subject" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 74px;" BorderStyle="Solid" BackColor="Red" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Delete Subject" BorderColor="Red" />-->
            </asp:Panel>
            <div style="padding-top:60px; padding-bottom:60px; padding-left:100px; padding-right:100px">

            <asp:Panel ID="add" runat="server" HorizontalAlign="Center" BorderWidth="2px" BorderStyle="Groove" Width="100%" Visible="true">
               <div style="text-align:center; margin-right:300px; text-anchor:middle; font-size:1.0em; font-weight:500; padding:10px">
                        <h2 style="text-align:center; text-anchor:middle; font-size:1.6em; font-weight:600"">Add Subjects</h2>
                    </div>
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject Code:"/>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="subject_code" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" TabIndex="3"/>
                <asp:Label ID="error" runat="server" Visible="false" style="text-align:center; padding-left:10px; position:absolute; text-anchor:middle; font-size:1.1em; font-weight:600" ForeColor="Red" Font-Bold="true" Text="This Subject Code already exists..!!" />
                <br /><br />
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject Name:"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="subject_name" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" TabIndex="4" />
                <br />
                <br />
                <asp:Label runat="server" Font-Bold="true" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Text="Written Full Marks:" />
                &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="full_marks_written" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" MaxLength="3" TextMode="Phone" TabIndex="5" />
                <br />
                <br />
                <asp:Label runat="server" Font-Bold="true" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Text="Oral Full Marks:" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:TextBox ID="full_marks_oral" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" MaxLength="3" TextMode="Phone" TabIndex="6" />
                <br />
                <br />
                <asp:Label runat="server" Font-Bold="true" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Text="Practical Full Marks:" />
                &nbsp;&nbsp;&nbsp; <asp:TextBox ID="full_marks_practical" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" TextMode="Phone" TabIndex="7"/><br /><br />
                <asp:Button ID="add_confirm" runat="server" Style="z-index: 1; " BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Add" BorderColor="#0066FF" OnClick="add_confirm_Click" TabIndex="8" />
                <br />
                <br />

            </asp:Panel>
            <asp:Panel ID="edit" runat="server"  BorderWidth="2px" BorderStyle="Groove" HorizontalAlign="Center" Width="100%" Visible="false">
                <div style="text-align:center; margin-right:200px; text-anchor:middle; font-size:1.0em; font-weight:500">
                        <h2 style="text-align:center; text-anchor:middle; font-size:1.6em; font-weight:600"">Edit Subjects</h2>
                    </div>
                 <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject Code:"/>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList runat="server" ID="subject_code_ddl" Width="148px" Height="23px" AutoPostBack="True" OnSelectedIndexChanged="subject_code_ddl_SelectedIndexChanged" TabIndex="3">
                    <asp:ListItem Value="0" Text="-Select Item-">-Select Item-</asp:ListItem>
                </asp:DropDownList>
                <br /><br />
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject Name:"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="update_subject_name" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" TabIndex="4" />
                <br />
                <br />
                <asp:Label runat="server" Font-Bold="true" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Text="Written Full Marks:" />
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:TextBox ID="update_full_marks_written" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" MaxLength="3" TextMode="Phone" TabIndex="5" />
                <br />
                <br />
                <asp:Label runat="server" Font-Bold="true" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Text="Oral Full Marks:" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                <asp:TextBox ID="update_full_marks_oral" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" MaxLength="3" TextMode="Phone" TabIndex="6" />
                <br />
                <br />
                <asp:Label runat="server" Font-Bold="true" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Text="Practical Full Marks:" />
                &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="update_full_marks_practical" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" MaxLength="3" TextMode="Phone" TabIndex="7"/><br /><br />
                <asp:Button ID="update_confirm" runat="server" Style="z-index: 1; " BorderStyle="Solid" BackColor="#00CC00" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Update" BorderColor="#00CC00" OnClick="update_confirm_Click" TabIndex="8" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="delete_confirm" runat="server" Style="z-index: 1; " BorderStyle="Solid" BackColor="Red" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Delete" BorderColor="Red" OnClick="delete_confirm_Click" TabIndex="9" />
                <br />
                <br />
            </asp:Panel>
            <asp:Panel ID="delete" runat="server" HorizontalAlign="Center" Width="100%">

            </asp:Panel>

            </div>
        </div>
        
    </asp:Panel>
</asp:Content>
