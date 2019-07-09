<%@ Page Title="" Language="C#" MasterPageFile="sishubikash_logged_in.Master" AutoEventWireup="true" CodeBehind="manage_users.aspx.cs" Inherits="School_Management_System.post_user_login.manage_users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server" Width="1300px" HorizontalAlign="Center" Wrap="true">
        <div style="text-align: center; position: center; padding-left: 60px; text-anchor: middle; font-size: 1.0em; font-weight: 500">
            <asp:Panel runat="server" HorizontalAlign="Center" Width="100%">
                <section id="home" class="slideInright">
                    <h1 style="text-align: center; text-anchor: middle; font-size: 1.8em; font-weight: 800">Manage Employees</h1>
                    <asp:Button ID="add_employee" runat="server" Style="z-index: 1; top: 0px; position: relative; left: -26px;" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Add Employee" BorderColor="#0066FF"/>
                    <asp:Button ID="edit_employee" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 26px;" BorderStyle="Solid" BorderWidth="4px" BorderColor="#c0c0c0" ForeColor="White" BackColor="#c0c0c0" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" Text="Edit Employee"/>
                    <!-- <asp:Button ID="delete_subject" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 74px;" BorderStyle="Solid" BackColor="Red" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Delete Subject" BorderColor="Red" />
                -->
                </section>
            </asp:Panel>
            <div style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px">

                <!--ADD SECTION-->
                <asp:Panel ID="add" runat="server" HorizontalAlign="Center" BorderWidth="1px" BorderStyle="Groove" Visible="true">
                    <div style="padding-left: 40px; align-self: center; padding-top: 10px; padding-bottom: 10px; padding-right: 40px; position: center" class="text-justify">
                        <!--BASIC DETAILS-->
                        <section id="basicdetails" class="slideInright">
                            <div>
                                <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Basic Details</h4>
                                <!--AADHAR NUMBER-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Aadhar No." Height="17px" Width="172px" />
                                <asp:TextBox ID="aadhar_no" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--USERID-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="User Id.:" Height="17px" Width="172px" />
                                <asp:TextBox ID="userid" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                <br />
                                <!--NAME-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Employee Name:" Height="17px" Width="172px" />
                                <asp:TextBox ID="name" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" AutoCompleteType="DisplayName" TabIndex="1" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--RELIGION DETAILS-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Religion:" Width="172px" />
                                <asp:DropDownList ID="religion_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoPostBack="true" TabIndex="2" />
                                <asp:TextBox ID="religion_other" runat="server" Visible="false" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoCompleteType="Disabled" TabIndex="3" />
                                <br />
                                <!--GENDER-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Gender:" Width="172px" />
                                <asp:DropDownList ID="gender_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" TabIndex="4">
                                    <asp:ListItem Value="0" Text="-SELECT ITEM-" />
                                    <asp:ListItem Value="Male" Text="Male" />
                                    <asp:ListItem Value="Female" Text="Female" />
                                    <asp:ListItem Value="Others" Text="Others" />
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--BLOOD GROUP DETAILS-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Blood Group:" Width="172px" />
                                <asp:DropDownList ID="blood_group_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoPostBack="true" TabIndex="5" />
                                <asp:TextBox ID="blood_group_other" runat="server" Visible="false" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoCompleteType="Disabled" TabIndex="6" />
                                <br />
                                <!--FATHER OR NAME-->
                                <asp:Label runat="server" Font-Bold="True" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Father/Husband Name:" Width="172px" />
                                <asp:TextBox ID="f_h_name" runat="server" Height="23px" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" AutoCompleteType="DisplayName" TabIndex="10" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--CASTE DETAILS-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Caste:" Width="172px" />
                                <asp:DropDownList ID="caste_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoPostBack="true"  TabIndex="8" />
                                <asp:TextBox ID="caste_other" runat="server" Visible="false" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoCompleteType="Disabled" TabIndex="9" />
                                <br />
                                <!--DATE OF BIRTH-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Date Of Birth:" Width="172px" />
                                <asp:TextBox ID="dob" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Date" AutoCompleteType="Disabled" TabIndex="7" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--QUALIFICATION DETAILS-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Qualification:" Width="172px" />
                                <asp:TextBox ID="qualification" runat="server" Height="23px" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" TabIndex="10" /><br />
                            </div>
                        </section>

                        <!--CONTACT DETAILS-->
                        <section id="contactdetails" class="slideInright">
                            <div>
                                <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Contact Details</h4>
                                <!--CONTACT NUMBER-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Contact No 1.:" Height="17px" Width="172px" />
                                <asp:TextBox ID="contact_no1" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="10" TextMode="Phone" AutoCompleteType="Disabled" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--GUARDIAN CONTACT NUMBER-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Contact No 2." Height="17px" Width="172px" />
                                <asp:TextBox ID="contact_no2" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="10" TextMode="Phone" AutoCompleteType="Disabled" />
                                <br />
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Email Id:" Height="17px" Width="172px" />
                                <asp:TextBox ID="emailid" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Email" AutoCompleteType="Disabled" />
                            </div>
                        </section>

                        <!--ADDRESS DETAILS-->
                        <section id="permanentaddressdetails" class="slideInright">
                            <div>
                                <!--PERMANENT ADDRESS DETAILS-->
                                <!--HOUSE OR WARD NUMBER-->
                                <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Permanent Address</h4>
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Road/House Name:" Height="17px" Width="172px" />
                                <asp:TextBox ID="pad_hno" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeStreetAddress" TabIndex="13" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--VILLAGE/TOWN ADDRESS-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Village/Area:" Height="17px" Width="172px" />
                                <asp:TextBox ID="pad_area" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeStreetAddress" TabIndex="14" />
                                <br />
                                <!--CITY ADDRESS-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="City:" Height="17px" Width="172px" />
                                <asp:TextBox ID="pad_city" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeCity" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--PIN NUMBER-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Pin No.:" Height="17px" Width="172px" />
                                <asp:TextBox ID="pad_pin" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeZipCode" MaxLength="6" />
                                <br />
                                <!--DISTRICT-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="District:" Height="17px" Width="172px" />
                                <asp:TextBox ID="pad_district" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeCity" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--STATE-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="State:" Height="17px" Width="172px" />
                                <asp:TextBox ID="pad_state" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeState" />
                                <br />
                            </div>
                        </section>

                        <!--LOCAL ADDRESS DETAILS-->
                        <section id="localaddressdetails" class="slideInright">
                            <div>
                                <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Local Address</h4>
                                <asp:CheckBox ID="pad_to_lad_sync" runat="server" Text=" Same as permanent address." AutoPostBack="true"  />
                                <asp:Label ID="instructon_for_pad_to_lad_sync" runat="server" Text="  (Uncheck The Check Box To Edit Permanent Address.)" Visible="false"/>
                                <br />
                                <!--HOUSE OR WARD NUMBER-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Road/House Name:" Height="17px" Width="172px" />
                                <asp:TextBox ID="lad_hno" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeStreetAddress" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--VILLAGE/TOWN ADDRESS-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Village/Area:" Height="17px" Width="172px" />
                                <asp:TextBox ID="lad_area" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeStreetAddress" />
                                <br />
                                <!--CITY ADDRESS-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="City:" Height="17px" Width="172px" />
                                <asp:TextBox ID="lad_city" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeCity" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--PIN NUMBER-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Pin No.:" Height="17px" Width="172px" />
                                <asp:TextBox ID="lad_pin" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeZipCode" MaxLength="6" />
                                <br />
                                <!--DISTRICT-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="District:" Height="17px" Width="172px" />
                                <asp:TextBox ID="lad_district" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="HomeCity" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--STATE-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="State:" Height="17px" Width="172px" />
                                <asp:TextBox ID="lad_state" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoPostBack="true" AutoCompleteType="HomeState" />
                            </div>
                        </section>

                        <!--RECRUITMENT DETAILS-->
                        <section id="addmissiondetails" class="slideInright">
                            <div>
                                <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Recruitment Details</h4>
                                <!--RECRUITMENT DATE-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Recruitment Date:" Height="17px" Width="172px" />
                                <asp:TextBox ID="recruitment_date" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Date" AutoCompleteType="Disabled" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--STATUS/NOTE-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="NOTE:" Height="17px" Width="172px" AutoCompleteType="Disabled" />
                                <asp:TextBox ID="note" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" AutoCompleteType="Disabled"  placeholder="Hello"/>
                                <br />
                                <asp:CheckBox ID="xemployee_check" runat="server" Text=" Ex Employee of this Institution" AutoPostBack="true"/>
                                <br />
                                <asp:Label ID="x_userid_label" runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Visible="false" Text="Previous User Id:" Height="17px" Width="172px" />
                                <asp:TextBox ID="x_userid" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" Visible="false" TextMode="SingleLine" AutoCompleteType="Disabled"/>
                            </div>
                        </section>

                        <section id="security_details" class="slideInright">
                            <div>
                                <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">User LogIn Access Details</h4>
                                <!--EMPLOYEE ROLE-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Employee Role:" Height="17px" Width="172px" />
                                <asp:DropDownList ID="employee_role_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" TabIndex="4">
                                    <asp:ListItem Value="0" Text="-SELECT ITEM-" />
                                    <asp:ListItem Value="website_manager" Text="Website Manager" />
                                    <asp:ListItem Value="teachers_professors" Text="Teachers And Professors" />
                                    <asp:ListItem Value="staff_members" Text="Staff Members" />
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--STATUS/NOTE-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Security Level:" Height="17px" Width="172px" AutoCompleteType="Disabled" />
                                <asp:DropDownList ID="DropDownList1" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" TabIndex="4">
                                    <asp:ListItem Value="0" Text="-SELECT ITEM-" />
                                    <asp:ListItem Value="1" Text="Security Lv. 1" />
                                    <asp:ListItem Value="2" Text="Security Lv. 2" />
                                    <asp:ListItem Value="3" Text="Security Lv. 3" />
                                </asp:DropDownList>
                                <br />
                            </div>
                        </section>
                        <br />
                        <!--SUBMIT BUTTON-->
                        <div style="margin-left: 250px; text-anchor: start; font-size: 1.0em; font-weight: 500; padding-left: 10px; padding-right: 10px">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="add_confirm" runat="server" Style="z-index: 1; padding-left: 20px; padding-right: 20px" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Add" BorderColor="#0066FF" />
                        </div>
                    </div>
                </asp:Panel>
            </div>

            <!-- 
                EDIT SECTION
                CONTINUES
                FROM HERE
             -->

            <div style="padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 0px">
                <!--EDIT SECTION-->
                <asp:Panel ID="edit" runat="server" HorizontalAlign="Center" BorderWidth="1px" BorderStyle="Groove" Visible="true">
                    <div style="padding-left: 40px; align-self: center; padding-top: 10px; padding-bottom: 10px; padding-right: 40px; position: center" class="text-justify">
                        <!--ID SELECTION-->
                        <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="True" Text="Employee UserId:" Height="17px" />
                        <asp:DropDownList ID="e_id_ddl" runat="server" CssClass="" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoPostBack="true" >
                        </asp:DropDownList>
                        <!--FETCH DETAILS-->

                        <div>
                            <!--BASIC DETAILS-->
                            <section id="e_basicdetails" class="slideInright">
                                <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Basic Details</h4>
                                <div>
                                    <!--NAME-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Name:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_name" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--RELIGION DETAILS-->
                                    <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Religion:" Width="172px" />
                                    <asp:DropDownList ID="e_religion_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoPostBack="true"/>
                                    <asp:TextBox ID="e_religion_other" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Visible="false" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--GENDER-->
                                    <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Gender:" Width="172px" />
                                    <asp:DropDownList ID="e_gender_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px">
                                        <asp:ListItem Value="0" Text="-SELECT ITEM-" />
                                        <asp:ListItem Value="Male" Text="Male" />
                                        <asp:ListItem Value="Female" Text="Female" />
                                        <asp:ListItem Value="Others" Text="Others" />
                                    </asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--BLOOD GROUP DETAILS-->
                                    <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Blood Group:" Width="172px" />
                                    <asp:DropDownList ID="e_blood_group_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoPostBack="true"  />
                                    <asp:TextBox ID="e_blood_group_other" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Visible="false" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--DATE OF BIRTH-->
                                    <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Date Of Birth:" Width="172px" />
                                    <asp:TextBox ID="e_dob" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" AutoCompleteType="Disabled" TextMode="Date" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--CASTE DETAILS-->
                                    <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Caste:" Width="172px" />
                                    <asp:DropDownList ID="e_caste_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" AutoPostBack="true"  />
                                    <asp:TextBox ID="e_caste_other" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Visible="false" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--FATHER NAME-->
                                    <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Father's Name:" Width="172px" />
                                    <asp:TextBox ID="e_father_name" runat="server" Height="23px" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--MOTHER NAME-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Mother's Name:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_mother_name" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--GUARDIAN NAME-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Guardian's Name:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_guardian_name" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" AutoCompleteType="Disabled" />
                                    <br />
                                </div>
                            </section>

                            <!--CONTACT DETAILS-->
                            <section id="e_contactdetails" class="slideInright">
                                <div>
                                    <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Contact Details</h4>
                                    <!--CONTACT NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Contact No 1.:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_contact_no1" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="10" TextMode="Phone" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--GUARDIAN CONTACT NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Contact No 2." Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_contact_no2" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="10" TextMode="Phone" AutoCompleteType="Disabled" />
                                    <br />
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Email Id:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_emailid" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Email" AutoCompleteType="Disabled"/>
                                </div>
                            </section>

                            <!--ADDRESS DETAILS-->
                            <section id="e_permanentaddressdetails" class="slideInright">
                                <div>
                                    <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Permanent Address</h4>
                                    <!--PERMANENT ADDRESS DETAILS-->
                                    <!--HOUSE OR WARD NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Road/House Name:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_pad_hno" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--VILLAGE/TOWN ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Village/Area:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_pad_area" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--CITY ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="City:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_pad_city" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--PIN NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Pin No.:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_pad_pin" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--DISTRICT-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="District:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_pad_district" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--STATE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="State:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_pad_state" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    <br />
                                </div>
                            </section>

                            <!--LOCAL ADDRESS DETAILS-->
                            <section id="e_localaddressdetails" class="slideInright">
                                <div>
                                    <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Local Address</h4>
                                    <asp:CheckBox ID="e_pad_to_lad_sync" runat="server" Text=" Same as permanent address." AutoPostBack="true"  />
                                    <asp:Label ID="e_instructon_for_pad_to_lad_sync" runat="server" Text="  (Uncheck The Check Box To Edit Permanent Address.)" Visible="false"/>
                                    <br />
                                    <!--HOUSE OR WARD NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Road/House Name:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_lad_hno" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--VILLAGE/TOWN ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Village/Area:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_lad_area" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--CITY ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="City:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_lad_city" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--PIN NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Pin No.:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_lad_pin" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--DISTRICT-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="District:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_lad_district" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--STATE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="State:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_lad_state" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                </div>
                            </section>

                            <!--RECRUITMENT DETAILS-->
                            <section id="e_addmissiondetails" class="slideInright">
                                <div>
                                    <h4 style="text-align: left; text-anchor: middle; font-size: 1.2em; font-weight: 800">Recruitment Details</h4>
                                    <!--RECRUITMENT DATE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Recruitment Date:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_RECRUITMENT_date" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Date" AutoCompleteType="Disabled" ReadOnly="True" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <!--TRANSFERRED FROM-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Transferred From:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_tc_from" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" AutoCompleteType="Disabled" />
                                    <br />
                                    <!--transferred parameter-->
                                    <asp:CheckBox ID="e_transferred_parameter" runat="server" AutoPostBack="true" Text="Resigned" />
                                    <br />
                                    <asp:Panel ID="e_resignation_field" runat="server" Visible="false">
                                        <!--RESIGNATION DATE-->
                                        <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Transferred Date:" Height="17px" Width="172px" />
                                        <asp:TextBox ID="e_tc_date" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Date" AutoCompleteType="Disabled" ReadOnly="True" />
                                        <br />
                                    </asp:Panel>
                                    <!--STATUS/NOTE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="NOTE:" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_note" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" AutoCompleteType="Disabled" />
                                    <br />
                                    <asp:CheckBox ID="e_employee_check" runat="server" Text=" Ex Employee of this Institution" AutoPostBack="true"/>
                                    <br />
                                    <asp:Label ID="e_x_userid_label" runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Ex Registration Id:" Visible="false" Height="17px" Width="172px" />
                                    <asp:TextBox ID="e_x_userid" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" Visible="false" ReadOnly="false" TextMode="SingleLine" AutoCompleteType="Disabled" />

                                </div>
                            </section>

                            <br />
                            <!--SUBMIT BUTTON-->
                            <div style="margin-left: 250px; text-anchor: start; font-size: 1.0em; font-weight: 500; padding-left: 10px; padding-right: 10px">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                                    <asp:Button ID="update_data" runat="server" Style="z-index: 1; padding-left: 20px; padding-right: 20px" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Update" BorderColor="#0066FF" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="delete_data" runat="server" Style="z-index: 1; padding-left: 20px; padding-right: 20px" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Delete" BorderColor="#0066FF" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <!--VIEW SECTION
                <asp:Panel ID="view" runat="server" HorizontalAlign="Center" BorderWidth="1px" BorderStyle="Groove" Width="100%" Visible="true">

                    <div style="padding-left: 60px; align-self: center; padding-bottom: 10px; padding-right: 60px; position: center" class="text-justify">
                        
                    </div>

                </asp:Panel>-->



            </div>
        </div>
    </asp:Panel>
</asp:Content>
