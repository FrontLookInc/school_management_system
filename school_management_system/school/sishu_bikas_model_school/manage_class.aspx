<%@ Page Title="" Language="C#" MasterPageFile="~/school/sishu_bikas_model_school/sishubikash_logged_in.Master" AutoEventWireup="true" CodeBehind="manage_class.aspx.cs" Inherits="School_Management_System.school.sishu_bikas_model_school.schoolmanagement.manage_class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" BorderStyle="Groove" Width="100%" Height="600px">
        <div style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:500">
            <h1 style="text-align:center; text-anchor:middle; font-size:1.8em; font-weight:800"">Manage Classes</h1>
            <br />
            <br />
            <br />
            <asp:Panel runat="server" HorizontalAlign="Center" Width="100%">
                <asp:Button ID="add_class" runat="server" Style="z-index: 1; top: 0px; position: relative; left: -26px;" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Add Class" BorderColor="#0066FF" />
                <asp:Button ID="edit_class" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 24px;" BorderStyle="Solid" BackColor="#00CC00" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Edit Class" BorderColor="#00CC00" />
                <asp:Button ID="delete_class" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 74px;" BorderStyle="Solid" BackColor="Red" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Delete Class" BorderColor="Red" />
            </asp:Panel>
            <br />
            <br />
            <br />
            <div>

            <asp:Panel ID="add" runat="server" HorizontalAlign="Center" Width="100%">
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Class Name:"/>
                &nbsp;<asp:TextBox ID="class_name" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/><br /><br /><br /><br />
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 01:"/>
                &nbsp;<asp:TextBox ID="TextBox1" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 02:"/>
                &nbsp;<asp:TextBox ID="TextBox2" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/><br /><br />
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 03:"/>
                &nbsp;<asp:TextBox ID="TextBox3" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 04:"/>
                &nbsp;<asp:TextBox ID="TextBox4" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/><br /><br />
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 05:"/>
                &nbsp;<asp:TextBox ID="TextBox5" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 06:"/>
                &nbsp;<asp:TextBox ID="TextBox6" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/><br /><br />
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 07:"/>
                &nbsp;<asp:TextBox ID="TextBox7" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 08:"/>
                &nbsp;<asp:TextBox ID="TextBox8" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/><br /><br />
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 09:"/>
                &nbsp;<asp:TextBox ID="TextBox9" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400" Font-Bold="true" Text="Subject 10:"/>
                &nbsp;<asp:TextBox ID="TextBox10" runat="server" style="text-align:center; text-anchor:middle; font-size:1.0em; font-weight:400"/><br /><br />

            </asp:Panel>
            <asp:Panel ID="edit" runat="server" HorizontalAlign="Center" Width="100%">

            </asp:Panel>
            <asp:Panel ID="delete" runat="server" HorizontalAlign="Center" Width="100%">

            </asp:Panel>

            </div>
        </div>
        
    </asp:Panel>
</asp:Content>
