<%@ Page Title="" Language="C#" MasterPageFile="sishubikash_logged_in.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="School_Management_System.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel runat="server">
        <div style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 500">

            <asp:Panel runat="server" HorizontalAlign="Center" Width="100%">
                <section id="home" class="slideInright">
                    <br />
                    <br />
                    <br />
                    <h1 style="text-align: center; text-anchor: middle; font-size: 1.8em; font-weight: 800">Manage Students</h1>
                    <br />
                    <asp:Button ID="add_student" runat="server" Style="z-index: 1; top: 0px; position: relative; left: -26px;" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="New Student" BorderColor="#0066FF" />
                    <asp:Button ID="edit_student" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 24px;" BorderStyle="Solid" BackColor="#00CC00" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Edit Student" BorderColor="#00CC00" />
                    <!--                <asp:Button ID="delete_subject" runat="server" Style="z-index: 1; top: 0px; position: relative; left: 74px;" BorderStyle="Solid" BackColor="Red" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Delete Subject" BorderColor="Red" />-->
                </section>
            </asp:Panel>
            <div style="padding-top: 10px; padding-bottom: 60px; padding-left: 0px; padding-right: 0px">

                <!--ADD SECTION-->
                <asp:Panel ID="add" runat="server" HorizontalAlign="Center" BorderWidth="1px" BorderStyle="Groove" Width="100%" Visible="true">
                    <div style="padding-left: 60px; align-self: center; padding-bottom: 10px; padding-right: 60px; position: center" class="text-justify">
                        <div style="text-align: start; text-anchor: start; font-size: 1.0em; font-weight: 500; padding: 0px">

                            <br />
                            <br />
                            <div class="collapse navbar-collapse" id="lauraMenu">
                                <ul class="nav navbar-nav navbar-left navbar-border navbar-fixed-bottom" style="padding-top: 0px; opacity: 100; background-color: white; color: black">
                                    <li><a href="#home">Back To Top</a></li>
                                    <li><a href="#basicdetails">Basic Details</a></li>
                                    <li><a href="#permanentaddressdetails">Permanent Address Details</a></li>
                                    <li><a href="#localaddressdetails">Local Address Details</a></li>
                                    <li><a href="#contactdetails">Contact Details</a></li>
                                    <li><a href="#addmissiondetails">Admission Details</a></li>
                                </ul>
                            </div>
                        </div>

                        <!--BASIC DETAILS-->
                        <section id="basicdetails" class="slideInright">
                            <div>
                                <br />
                                <br />
                                <br />
                                <h3 style="text-align: start; text-anchor: start; font-size: 1.6em; font-weight: 600">Add Students</h3>
                                <br />
                                <div>
                                    <h4 style="text-align: start; text-anchor: start; font-size: 1.6em; font-weight: 600">Basic Details</h4>
                                    <br />
                                </div>
                                <!--NAME-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Name:" Height="17px" Width="160px" />
                                <asp:TextBox ID="name" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" />

                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--DATE OF BIRTH-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Date Of Birth:" Width="160px" />
                                <asp:TextBox ID="dob" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Date" />
                                <br />
                                <br />

                                <!--GENDER-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Gender:" Width="160px" />
                                <asp:DropDownList ID="gender_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" />

                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--BLOOD GROUP DETAILS-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Blood Group:" Width="160px" />
                                <asp:DropDownList ID="blood_group_ddl" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" />
                                <asp:TextBox ID="blood_group" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" />
                                <br />
                                <br />
                                <!--FATHER NAME-->
                                <asp:Label runat="server" Font-Bold="true" Height="17px" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Text="Father's Name:" Width="160px" />
                                <asp:TextBox ID="father_name" runat="server" Height="23px" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Width="371px" />

                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <!--MOTHER NAME-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Mother's Name:" Height="17px" Width="160px" />
                                <asp:TextBox ID="mother_name" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" />

                                <br />
                                <br />
                                <!--GUARDIAN NAME-->
                                <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Guardian's Name:" Height="17px" Width="160px" />
                                <asp:TextBox ID="guardian_name" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" />

                                <br />
                                <br />
                            </div>
                        </section>

                        <!--ADDRESS DETAILS-->
                        <section id="permanentaddressdetails" class="slideInright">
                            <div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <div style="text-align: start; text-anchor: start; font-size: 1.0em; font-weight: 500; padding: 0px">
                                    <h4 style="text-align: start; text-anchor: start; font-size: large">Address Details</h4>
                                    <br />
                                </div>
                                <!--PERMANENT ADDRESS DETAILS-->
                                <div>
                                    <div style="text-align: start; text-anchor: start; font-size: 1.0em; font-weight: 500; padding: 0px">
                                        <h5 style="text-align: start; text-anchor: start; font-size: medium">Permanent Address</h5>
                                    </div>
                                    <br />
                                    <!--HOUSE OR WARD NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="House No./Ward No.:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="p_house_ward" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--VILLAGE/TOWN ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Village/Area:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="p_village_add" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    <br />
                                    <br />
                                    <!--CITY ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="City:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="p_city_address" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--PIN NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Pin No.:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="p_pin_no" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    <br />
                                    <br />
                                    <!--DISTRICT-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="District:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="p_district_add" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--STATE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="State:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="p_state_add" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </section>

                        <!--LOCAL ADDRESS DETAILS-->
                        <section id="localaddressdetails" class="slideInright">
                            <div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <div style="text-align: start; text-anchor: start; font-size: 1.0em; font-weight: 500; padding: 0px">
                                    <h5 style="text-align: start; text-anchor: start; font-size: medium">Local Address</h5>
                                </div>
                                <div>
                                    <asp:CheckBox ID="parmanent_address_sync" runat="server" Text=" Same as permanent address." /><br />
                                    <br />
                                    <!--HOUSE OR WARD NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="House No./Ward No.:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="l_house_ward" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--VILLAGE/TOWN ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Village/Area:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="l_village_add" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    <br />
                                    <br />
                                    <!--CITY ADDRESS-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="City:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="l_city_add" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--PIN NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Pin No.:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="l_pin_no" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    <br />
                                    <br />
                                    <!--DISTRICT-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="District:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="l_district_add" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--STATE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="State:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="l_state_add" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="SingleLine" />
                                </div>
                            </div>
                        </section>

                        <!--CONTACT DETAILS-->
                        <section id="contactdetails" class="slideInright">
                            <div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <div style="text-align: start; text-anchor: start; font-size: 1.0em; font-weight: 500; padding: 0px">
                                    <h4 style="text-align: start; text-anchor: start; font-size: large">Contact Details</h4>
                                </div>
                                <br />
                                <div>
                                    <!--CONTACT NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Contact No.:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="contact_no" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="10" TextMode="Phone" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--GUARDIAN CONTACT NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Guardian's Contact No." Height="17px" Width="160px" />
                                    <asp:TextBox ID="guardian_contact_no" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="10" TextMode="Phone" />
                                    <br />
                                    <br />
                                    <!--FATHER CONTACT NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Father's Contact No.:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="father_conact_no" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="10" TextMode="Phone" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--MOTHER CONTACT NUMBER-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Mother's Contact No.:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="mother_contact_no" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" MaxLength="110" TextMode="Phone" />
                                    <br />
                                    <br />
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Email Id:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="emailid" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Email" />

                                </div>
                            </div>
                        </section>

                        <!--ADMISSION DETAILS-->
                        <section id="addmissiondetails" class="slideInright">
                            <div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <div style="text-align: start; text-anchor: start; font-size: 1.0em; font-weight: 500; padding: 0px">
                                    <h4 style="text-align: start; text-anchor: start; font-size: large">Admission Details</h4>
                                </div>
                                <br />
                                <div>
                                    <!--ADMISSION DATE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Admission Date:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="admission_date" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Date" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <!--TRANSFERRED FROM-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="Transferred From:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="tc_from" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" TextMode="Date" />
                                    <br />
                                    <br />
                                    <!--STATUS/NOTE-->
                                    <asp:Label runat="server" Style="text-align: start; text-anchor: middle; font-size: 1.0em; font-weight: 400" Font-Bold="true" Text="NOTE:" Height="17px" Width="160px" />
                                    <asp:TextBox ID="status" runat="server" Style="text-align: center; text-anchor: middle; font-size: 1.0em; font-weight: 400" Height="23px" Width="371px" />
                                </div>
                            </div>
                        </section>
                        <br />
                        <br />
                        <!--SUBMIT BUTTON-->
                        <div style="margin-left: 250px; text-anchor: start; font-size: 1.0em; font-weight: 500; padding-left: 10px; padding-right: 10px">
                            <asp:Button ID="add_confirm" runat="server" Style="z-index: 1; padding-left: 20px; padding-right: 20px" BorderStyle="Solid" BackColor="#0066FF" ForeColor="White" EnableTheming="False" Font-Size="1.2em" Font-Bold="True" BorderWidth="4px" Text="Add" BorderColor="#0066FF" />
                        </div>
                        <br />
                        <br />
                    </div>
                </asp:Panel>

                <br />

                <!--<asp:Panel ID="edit" runat="server" HorizontalAlign="Center" BorderWidth="2px" BorderStyle="Groove" Width="100%" Visible="true">
                </asp:Panel>-->




            </div>
        </div>
    </asp:Panel>
</asp:Content>
