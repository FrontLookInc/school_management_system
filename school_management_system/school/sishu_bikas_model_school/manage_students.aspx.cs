using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace School_Management_System.school.sishu_bikas_model_school
{
    public partial class manage_students : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["sishubikashmodelschooldb"].ConnectionString;
        static SqlConnection con = new SqlConnection(cs);
        SqlDataReader myreader = null;
        SqlCommand cmd = new SqlCommand("", con);

        //send strings
        string s_student_id = string.Empty, s_name = string.Empty, s_dob = string.Empty, s_gender = string.Empty, s_blood_group = string.Empty, 
            s_religion = string.Empty, s_caste = string.Empty, s_f_name = string.Empty, s_m_name = string.Empty, s_g_name = string.Empty, 
            s_pad_hno = string.Empty, s_pad_area = string.Empty, s_pad_city = string.Empty, s_pad_pin = string.Empty, s_pad_dist = string.Empty, 
            s_pad_state = string.Empty, s_lad_hno = string.Empty, s_lad_area = string.Empty, s_lad_city = string.Empty, s_lad_pin = string.Empty, 
            s_lad_dist = string.Empty, s_lad_state = string.Empty, s_con_no1 = string.Empty, s_con_no2 = string.Empty, s_emailid = string.Empty, 
            s_admission_dt = string.Empty, s_admission_tm = string.Empty, s_tc_from = string.Empty, s_note = string.Empty, s_x_students_reg_id = string.Empty, 
            s_tc = string.Empty, s_tc_to = string.Empty, s_tc_date = string.Empty, s_update_time = string.Empty, s_updated_by = string.Empty;

        //get strings
        string g_student_id = string.Empty, g_name = string.Empty, g_dob = string.Empty, g_gender = string.Empty, g_blood_group = string.Empty, 
            g_religion = string.Empty, g_caste = string.Empty, g_f_name = string.Empty, g_m_name = string.Empty, g_g_name = string.Empty, 
            g_pad_hno = string.Empty, g_pad_area = string.Empty, g_pad_city = string.Empty, g_pad_pin = string.Empty, g_pad_dist = string.Empty, 
            g_pad_state = string.Empty, g_lad_hno = string.Empty, g_lad_area = string.Empty, g_lad_city = string.Empty, g_lad_pin = string.Empty, 
            g_lad_dist = string.Empty, g_lad_state = string.Empty, g_con_no1 = string.Empty, g_con_no2 = string.Empty, g_emailid = string.Empty, 
            g_admission_dt = string.Empty, g_tc_from = string.Empty, g_note = string.Empty, g_x_students_reg_id = string.Empty, g_tc_to = string.Empty, 
            g_tc_date = string.Empty, g_tc = string.Empty, g_update_time = string.Empty, g_updated_by = string.Empty;

        DateTime admission_time, update_time;

        protected void Page_Load(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#content_show';", true);
            if (!IsPostBack)
            {
                onpageload_add();
            }
        }

        //Add Section

        protected void add_student_Click(object sender, EventArgs e)
        {
            add.Visible = true;
            edit.Visible = false;
            add_student.BorderColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
            add_student.BackColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
            edit_student.BorderColor = System.Drawing.ColorTranslator.FromHtml("#c0c0c0");
            edit_student.BackColor = System.Drawing.ColorTranslator.FromHtml("#c0c0c0");
            //ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#content_show';", true);
            Response.Redirect("manage_students.aspx#content_show");
            initialize_get_strings();
            initialize_send_strings();
            //onpageload_add();
        }

        protected void religion_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            religion_other.Visible = religion_ddl.SelectedItem.Text.Equals("Others");
        }

        protected void blood_group_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            blood_group_other.Visible = blood_group_ddl.SelectedItem.Text.Equals("Others");
        }

        protected void caste_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            caste_other.Visible = caste_ddl.SelectedItem.Text.Equals("Others");
        }

        protected void pad_to_lad_sync_CheckedChanged(object sender, EventArgs e)
        {
            if (pad_to_lad_sync.Checked)
            {
                if (addsection_permanentaddress_field_check())
                {
                    instructon_for_pad_to_lad_sync.Visible = true;

                    lad_hno.Text = pad_hno.Text;
                    lad_area.Text = pad_area.Text;
                    lad_city.Text = pad_city.Text;
                    lad_pin.Text = pad_pin.Text;
                    lad_district.Text = pad_district.Text;
                    lad_state.Text = pad_state.Text;

                    pad_hno.ReadOnly = true;
                    pad_area.ReadOnly = true;
                    pad_city.ReadOnly = true;
                    pad_pin.ReadOnly = true;
                    pad_district.ReadOnly = true;
                    pad_state.ReadOnly = true;

                    lad_hno.ReadOnly = true;
                    lad_area.ReadOnly = true;
                    lad_city.ReadOnly = true;
                    lad_pin.ReadOnly = true;
                    lad_district.ReadOnly = true;
                    lad_state.ReadOnly = true;

                    string x = "";
                    Boolean b = x_student_check(x);
                }
                else
                {
                    instructon_for_pad_to_lad_sync.Visible = false;

                    lad_hno.Text = string.Empty;
                    lad_area.Text = string.Empty;
                    lad_city.Text = string.Empty;
                    lad_pin.Text = string.Empty;
                    lad_district.Text = string.Empty;
                    lad_state.Text = string.Empty;

                    pad_hno.ReadOnly = false;
                    pad_area.ReadOnly = false;
                    pad_city.ReadOnly = false;
                    pad_pin.ReadOnly = false;
                    pad_district.ReadOnly = false;
                    pad_state.ReadOnly = false;

                    lad_hno.ReadOnly = false;
                    lad_area.ReadOnly = false;
                    lad_city.ReadOnly = false;
                    lad_pin.ReadOnly = false;
                    lad_district.ReadOnly = false;
                    lad_state.ReadOnly = false;

                    pad_to_lad_sync.Checked = false;
                }
            }
            else
            {
                instructon_for_pad_to_lad_sync.Visible = false;

                lad_hno.Text = string.Empty;
                lad_area.Text = string.Empty;
                lad_city.Text = string.Empty;
                lad_pin.Text = string.Empty;
                lad_district.Text = string.Empty;
                lad_state.Text = string.Empty;

                lad_hno.ReadOnly = false;
                lad_area.ReadOnly = false;
                lad_city.ReadOnly = false;
                lad_pin.ReadOnly = false;
                lad_district.ReadOnly = false;
                lad_state.ReadOnly = false;

                pad_hno.ReadOnly = false;
                pad_area.ReadOnly = false;
                pad_city.ReadOnly = false;
                pad_pin.ReadOnly = false;
                pad_district.ReadOnly = false;
                pad_state.ReadOnly = false;
            }
        }

        protected void lad_state_TextChanged(object sender, EventArgs e)
        {
            string x = "";
            Boolean b = x_student_check(x);
        }

        protected void xstudent_check_CheckedChanged(object sender, EventArgs e)
        {
            x_students_id.Visible = xstudent_check.Checked;
            x_students_reg_id_label.Visible = xstudent_check.Checked;
        }

        protected void add_confirm_Click(object sender, EventArgs e)
        {
            addsection_duplicate_check_save_data();
        }


        /*
         * FUNCTIONS FOR IMPLEMENTATION
         */

        /*initialising send strings*/
        protected void initialize_send_strings()
        {
            //send strings
            s_student_id = string.Empty; s_name = string.Empty; s_dob = string.Empty; s_gender = string.Empty; s_blood_group = string.Empty; s_religion = string.Empty;
            s_caste = string.Empty; s_f_name = string.Empty; s_m_name = string.Empty; s_g_name = string.Empty; s_pad_hno = string.Empty; s_pad_area = string.Empty;
            s_pad_city = string.Empty; s_pad_pin = string.Empty; s_pad_dist = string.Empty; s_pad_state = string.Empty; s_lad_hno = string.Empty; s_lad_area = string.Empty;
            s_lad_city = string.Empty; s_lad_pin = string.Empty; s_lad_dist = string.Empty; s_lad_state = string.Empty; s_con_no1 = string.Empty; s_con_no2 = string.Empty;
            s_emailid = string.Empty; s_admission_dt = string.Empty; s_admission_tm = string.Empty; s_tc_from = string.Empty; s_note = string.Empty; s_x_students_reg_id = string.Empty;
            s_tc = string.Empty; s_tc_to = string.Empty; s_tc_date = string.Empty; s_update_time = string.Empty; s_updated_by = string.Empty;
        }

        /*initialising get strings*/
        protected void initialize_get_strings()
        {
            //get strings
            string g_student_id = string.Empty; g_name = string.Empty; g_dob = string.Empty; g_gender = string.Empty; g_blood_group = string.Empty; g_religion = string.Empty;
            g_caste = string.Empty; g_f_name = string.Empty; g_m_name = string.Empty; g_g_name = string.Empty; g_pad_hno = string.Empty; g_pad_area = string.Empty;
            g_pad_city = string.Empty; g_pad_pin = string.Empty; g_pad_dist = string.Empty; g_pad_state = string.Empty; g_lad_hno = string.Empty; g_lad_area = string.Empty;
            g_lad_city = string.Empty; g_lad_pin = string.Empty; g_lad_dist = string.Empty; g_lad_state = string.Empty; g_con_no1 = string.Empty; g_con_no2 = string.Empty;
            g_emailid = string.Empty; g_admission_dt = string.Empty; g_tc_from = string.Empty; g_note = string.Empty; g_x_students_reg_id = string.Empty; g_tc_to = string.Empty;
            g_tc_date = string.Empty; g_tc = string.Empty; g_update_time = string.Empty; g_updated_by = string.Empty;
        }

        /*Functions to be executed on page load*/
        protected void onpageload_add()
        {
            if (!IsPostBack)
            {
                religion_ddl.Items.Clear();
                blood_group_ddl.Items.Clear();
                caste_ddl.Items.Clear();
            }
            
            e_religion_ddl.Items.Clear();
            e_blood_group_ddl.Items.Clear();
            e_caste_ddl.Items.Clear();
            e_id_ddl.Items.Clear();
            get_religion_data();
            get_blood_group_data();
            get_caste_data();
            set_admission_date();
        }

        /*Populating religion drop down list*/
        protected void get_religion_data()
        {
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Item-";
            newItem.Value = "0";
            religion_ddl.Items.Add(newItem);
            try
            {
                con.Close();
                cmd.CommandText = "SELECT DISTINCT religion FROM students";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text = myreader["religion"].ToString();
                    newItem1.Value = myreader["religion"].ToString();
                    religion_ddl.Items.Add(newItem1);
                }
                con.Close();
                ListItem newItem2 = new ListItem();
                newItem2.Text = "Others";
                newItem2.Value = "others";
                religion_ddl.Items.Add(newItem2);
            }
            catch (Exception error_religion_fetch)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + error_religion_fetch.Message + "');" +
                       "</script>");
            }
        }

        /*Populating blood group drop down list*/
        protected void get_blood_group_data()
        {
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Item-";
            newItem.Value = "0";
            blood_group_ddl.Items.Add(newItem);
            try
            {
                con.Close();
                cmd.CommandText = "SELECT DISTINCT blood_group FROM students";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text = myreader["blood_group"].ToString();
                    newItem1.Value = myreader["blood_group"].ToString();
                    blood_group_ddl.Items.Add(newItem1);
                }
                con.Close();
                ListItem newItem2 = new ListItem();
                newItem2.Text = "Others";
                newItem2.Value = "others";
                blood_group_ddl.Items.Add(newItem2);
            }
            catch (Exception error_blood_group_fetch)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + error_blood_group_fetch.Message + "');" +
                       "</script>");
            }
        }

        /*Setting admission date*/
        protected void set_admission_date()
        {
            admission_date.Text = DateTime.Parse(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
        }

        /*Populating caste drop down list*/
        protected void get_caste_data()
        {
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Item-";
            newItem.Value = "0";
            caste_ddl.Items.Add(newItem);
            try
            {
                con.Close();
                cmd.CommandText = "SELECT DISTINCT caste FROM students";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text = myreader["caste"].ToString();
                    newItem1.Value = myreader["caste"].ToString();
                    caste_ddl.Items.Add(newItem1);
                }
                con.Close();
                ListItem newItem2 = new ListItem();
                newItem2.Text = "Others";
                newItem2.Value = "others";
                caste_ddl.Items.Add(newItem2);
            }
            catch (Exception error_caste_fetch)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + error_caste_fetch.Message + "');" +
                       "</script>");
            }
        }

        /*getting data from form to input strings*/
        protected void get_data_to_s_string()
        {
            update_time = DateTime.Now;
            string y = update_time.Year.ToString();
            string m = update_time.Month.ToString();
            string d = update_time.Day.ToString();
            string hr = update_time.Hour.ToString();
            string min = update_time.Minute.ToString();
            string sec = update_time.Second.ToString();
            string milisec = update_time.Millisecond.ToString();

            if (m.Length.Equals(1))
            {
                string v = "0" + m;
                m = v;
            }
            if (d.Length.Equals(1))
            {
                string v = "0" + d;
                d = v;
            }
            if (hr.Length.Equals(0))
            {
                hr = "00";
            }
            else if (hr.Length.Equals(1))
            {
                string v = "0" + hr;
                hr = v;
            }
            if (min.Length.Equals(0))
            {
                min = "00";
            }
            else if (min.Length.Equals(1))
            {
                string v = "0" + min;
                min = v;
            }
            if (sec.Length.Equals(0))
            {
                sec = "00";
            }
            else if (sec.Length.Equals(1))
            {
                string v = "0" + sec;
                sec = v;
            }
            if (milisec.Length.Equals(0))
            {
                milisec = "000";
            }
            else if (milisec.Length.Equals(1))
            {
                string v = "00" + milisec;
                milisec = v;
            }
            else if (milisec.Length.Equals(2))
            {
                string v = "0" + milisec;
                milisec = v;
            }
            string c = y + m + d + hr + min + sec + milisec;

            //basic details
            s_student_id = y + m + d + hr + min + sec + milisec;
            s_name = name.Text;
            s_gender = gender_ddl.SelectedItem.Text;
            s_dob = dob.Text;
            s_f_name = father_name.Text;
            s_m_name = mother_name.Text;
            s_g_name = guardian_name.Text;
            if (religion_ddl.SelectedItem.Text.Equals("Others"))
            {
                s_religion = religion_other.Text;
            }
            else if (religion_ddl.SelectedItem.Value.Equals("0"))
            {
                s_religion = string.Empty;
            }
            else
            {
                s_religion = religion_ddl.SelectedItem.Text;
            }
            if (blood_group_ddl.SelectedItem.Text.Equals("Others"))
            {
                s_blood_group = blood_group_other.Text;
            }
            else if (blood_group_ddl.SelectedItem.Value.Equals("0"))
            {
                s_blood_group = string.Empty;
            }
            else
            {
                s_blood_group= blood_group_ddl.SelectedItem.Text;
            }
            if (caste_ddl.SelectedItem.Text.Equals("Others"))
            {
                s_caste = caste_other.Text;
            }
            else if (caste_ddl.SelectedItem.Value.Equals("0"))
            {
                s_caste = string.Empty;
            }
            else
            {
                s_caste = caste_ddl.SelectedItem.Text;
            }

            //address details
            //permanent address
            s_pad_hno = pad_hno.Text;
            s_pad_area = pad_area.Text;
            s_pad_city = pad_city.Text;
            s_pad_pin = pad_pin.Text;
            s_pad_dist = pad_district.Text;
            s_pad_state = pad_state.Text;
            //local addess
            s_lad_hno = lad_hno.Text;
            s_lad_area = lad_area.Text;
            s_lad_city = lad_city.Text;
            s_lad_pin = lad_pin.Text;
            s_lad_dist = lad_district.Text;
            s_lad_state = lad_state.Text;
            //contact details
            s_con_no1 = contact_no1.Text;
            s_con_no2 = contact_no2.Text;
            s_emailid = emailid.Text;
            //admission details
            admission_time = update_time;
            s_admission_dt = admission_time.Date.ToShortDateString();
            s_admission_tm = admission_time.TimeOfDay.ToString();
            s_tc_from = tc_from.Text;
            s_note = note.Text;
            if (xstudent_check.Checked)
            {
                s_x_students_reg_id = x_students_id.Text;
            }
            s_update_time = update_time.ToString();
            s_updated_by = "admin";
        }

        /*Checking if any duplicate data is available and if not saving data*/
        protected void addsection_duplicate_check_save_data()
        {
            if (addsection_other_field_check() && addsection_permanentaddress_field_check())
            {
                try
                {
                    con.Close();
                    string command = "SELECT b.* FROM " +
                       "(SELECT a.* FROM " +
                       "(SELECT * FROM " +
                       "students " +
                       "WHERE " +
                       "contact_no1='" + contact_no1.Text.ToString().Trim() + "' OR contact_no1='" + contact_no2.Text.ToString().Trim() +
                       "' OR contact_no2='" + contact_no1.Text.ToString().Trim() + "' OR contact_no2='" + contact_no2.Text.ToString().Trim() +
                       "' OR father_name='" + father_name.Text.ToString().Trim() + "' OR mother_name='" + mother_name.Text.ToString().Trim() +
                       "' OR guardian_name='" + guardian_name.Text.ToString().Trim() + "' OR guardian_name='" + father_name.Text.ToString().Trim() +
                       "' or guardian_name='" + mother_name.Text.ToString().Trim() + "') a " +
                       "WHERE " +
                       "a.contact_no1='" + contact_no1.Text.ToString().Trim() + "' OR a.contact_no1='" + contact_no2.Text.ToString().Trim() +
                       "' OR a.contact_no2='" + contact_no1.Text.ToString().Trim() + "' OR a.contact_no2='" + contact_no2.Text.ToString().Trim() + "') b " +
                       "WHERE " +
                       "b.name = '" + name.Text + "' ";
                    string command2 = "SELECT students_reg_id, name, contact_no1, contact_no2, dob FROM students WHERE name='" + name.Text + "' AND dob='" + dob.Text.ToString().Trim() +
                        "' AND (contact_no1='" + contact_no1.Text.ToString().Trim() + "' OR contact_no1='" + contact_no2.Text.ToString().Trim() +
                         "' OR contact_no2='" + contact_no1.Text.ToString().Trim() + "'  OR contact_no2='" + contact_no2.Text.ToString().Trim() + "') AND tc = 0";
                    cmd.CommandText = command2;
                    con.Open();
                    myreader = cmd.ExecuteReader();
                    int row_count = 0;
                    DataTable dt = new DataTable();
                    dt.Load(myreader);
                    row_count = dt.Rows.Count;
                    dt.Dispose();
                    myreader.Close();
                    myreader = cmd.ExecuteReader();

                    if (myreader.HasRows)
                    {
                        string v = "";
                        if (row_count == 1)
                        {
                            while (myreader.Read())
                            {
                                if (myreader["contact_no1"].ToString().Equals(contact_no1.Text.ToString()) && myreader["contact_no2"].ToString().Equals(contact_no2.Text.ToString()))
                                {
                                    v = "A student with \\nID:" + myreader["students_reg_id"].ToString() + "\\nName:" + myreader["name"].ToString() +
                                        " \\nhaving same contact numbers " + contact_no1.Text + " and " + contact_no2.Text + " is already available.";
                                }
                                else if (myreader["contact_no2"].ToString().Equals(contact_no1.Text.ToString()) && myreader["contact_no1"].ToString().Equals(contact_no2.Text.ToString()))
                                {
                                    v = "A student with \\nID:" + myreader["students_reg_id"].ToString() + "\\nName:" + myreader["name"].ToString() +
                                        " \\nhaving same contact numbers " + contact_no1.Text + " and " + contact_no2.Text + " is already available.";
                                }
                                else if (myreader["contact_no1"].ToString().Equals(contact_no1.Text.ToString()) && !myreader["contact_no2"].ToString().Equals(contact_no2.Text.ToString()))
                                {
                                    v = "A student with \\nID:" + myreader["students_reg_id"].ToString() + "\\nName:" + myreader["name"].ToString() +
                                        " \\nhaving same contact number " + contact_no1.Text + " is already available.";
                                }
                                else if (!myreader["contact_no1"].ToString().Equals(contact_no1.Text.ToString()) && myreader["contact_no2"].ToString().Equals(contact_no2.Text.ToString()))
                                {
                                    v = "A student with \\nID:" + myreader["students_reg_id"].ToString() + "\\nName:" + myreader["name"].ToString() +
                                        " \\nhaving same contact number " + contact_no2.Text + " is already available.";
                                }
                                else if (myreader["contact_no2"].ToString().Equals(contact_no1.Text.ToString()) && !myreader["contact_no1"].ToString().Equals(contact_no2.Text.ToString()))
                                {
                                    v = "A student with \\nID:" + myreader["students_reg_id"].ToString() + "\\nName:" + myreader["name"].ToString() +
                                        " \\nhaving same contact number " + contact_no1.Text + " is already available.";
                                }
                                else if (!myreader["contact_no2"].ToString().Equals(contact_no1.Text.ToString()) && myreader["contact_no1"].ToString().Equals(contact_no2.Text.ToString()))
                                {
                                    v = "A student with \\nID:" + myreader["students_reg_id"].ToString() + "\\nName:" + myreader["name"].ToString() +
                                        " \\nhaving same contact number " + contact_no2.Text + " is already available.";
                                }

                                Response.Write("<script language='javascript'>" +
                                   "window.alert('Cannot add new data...!!\\n" + v + " ');" +
                                   "</script>");
                            }
                        }
                        else if (row_count > 1)
                        {
                            while (myreader.Read())
                            {
                                string x = v;
                                v = x + "ID: " + myreader["students_reg_id"].ToString() + "\\n";
                            }

                            Response.Write("<script language='javascript'>" +
                                   "window.alert('Cannot add new data as the below listed student ids contain same name, date of birth and contact number. Please check the below list.\\n" + v + " ');" +
                                   "</script>");
                        }
                    }
                    else
                    {
                        save_data();
                    }

                }
                catch (Exception x)
                {
                    Response.Write("<script language='javascript'>" +
                        "window.alert('" + x.Message + "');" +
                        "</script>");
                }
            }
        }

        /*saving data*/
        protected void save_data()
        {
            myreader.Close();
            con.Close();
            get_data_to_s_string();
            string x_id = s_x_students_reg_id;

            string command1 = "INSERT INTO students (students_reg_id,name,dob,gender,blood_group,religion,caste,father_name,mother_name,guardian_name," +
                "p_address_hno,p_address_area,p_address_city,p_address_pin,p_address_dist,p_address_state," +
                "l_address_hno,l_address_area,l_address_city,l_address_pin,l_address_dist,l_address_state," +
                "contact_no1,contact_no2,email_id," +
                "admission_date,admission_time,tc_from,note,tc,x_students_reg_id,update_time,updated_by,obsolate) " +
                "VALUES('" + s_student_id + "','" + s_name + "','" + s_dob + "','" + s_gender + "','" + s_blood_group + "','"
                + s_religion + "','" + s_caste + "','" + s_f_name + "','" + s_m_name + "','" + s_g_name + "','"
                + s_pad_hno + "','" + s_pad_area + "','" + s_pad_city + "','" + s_pad_pin + "','" + s_pad_dist + "','" + s_pad_state + "','"
                + s_lad_hno + "','" + s_lad_area + "','" + s_lad_city + "','" + s_lad_pin + "','" + s_lad_dist + "','" + s_lad_state + "','"
                + s_con_no1 + "','" + s_con_no2 + "','" + s_emailid + "','"
                + s_admission_dt + "','" + s_admission_tm + "','" + s_tc_from + "','" + s_note + "','" + 0 + "','" + s_x_students_reg_id + "','" 
                + s_update_time + "','" + s_updated_by + "','" + 0 + "')";

            string command2 = "INSERT INTO students (students_reg_id,name,dob,gender,blood_group,religion,caste,father_name,mother_name,guardian_name," +
                "p_address_hno,p_address_area,p_address_city,p_address_pin,p_address_dist,p_address_state," +
                "l_address_hno,l_address_area,l_address_city,l_address_pin,l_address_dist,l_address_state," +
                "contact_no1,contact_no2,email_id," +
                "admission_date,admission_time,tc_from,note,tc,update_time,updated_by,obsolate) " +
                "VALUES('" + s_student_id + "','" + s_name + "','" + s_dob + "','" + s_gender + "','" + s_blood_group + "','"
                + s_religion + "','" + s_caste + "','" + s_f_name + "','" + s_m_name + "','" + s_g_name + "','"
                + s_pad_hno + "','" + s_pad_area + "','" + s_pad_city + "','" + s_pad_pin + "','" + s_pad_dist + "','" + s_pad_state + "','"
                + s_lad_hno + "','" + s_lad_area + "','" + s_lad_city + "','" + s_lad_pin + "','" + s_lad_dist + "','" + s_lad_state + "','"
                + s_con_no1 + "','" + s_con_no2 + "','" + s_emailid + "','"
                + s_admission_dt + "','" + s_admission_tm + "','" + s_tc_from + "','" + s_note + "','" + 0 + "','" + s_update_time + "','" + s_updated_by + "','" + 0 + "')";

            string command3 = "SELECT students_reg_id FROM students WHERE name='" + s_name + "' AND contact_no1='" + s_con_no1 + "' AND contact_no2='" + s_con_no2 + "' " +
                        "AND father_name='" + s_f_name + "' AND mother_name='" + s_m_name + "' AND guardian_name='" + s_g_name + "' AND tc = '"+false+ "' AND obsolate = '" + false + "'";

            string command4 = "UPDATE students SET " +
            "obsolate=1" + 
            "WHERE " +
            "students_reg_id='" + x_id + "'";
            int r = 0;

            if (xstudent_check.Checked)
            {
                cmd.CommandText = command1;
                con.Open();
                r = cmd.ExecuteNonQuery();
                con.Close();
                if (r.Equals(1))
                {
                    con.Close();
                    cmd.CommandText = command4;
                    con.Open();
                    int s = cmd.ExecuteNonQuery();
                    con.Close();
                    if (s.Equals(1))
                    {
                        con.Close();
                        cmd.CommandText = command3;
                        con.Open();
                        myreader = cmd.ExecuteReader();
                        if (myreader.HasRows)
                        {
                            string x = "";
                            while (myreader.Read())
                            {
                                x = myreader["students_reg_id"].ToString();
                            }
                            Response.Write("<script language='javascript'>" +
                           "window.alert('Data Saved Successfully with Student Registration Number:" + x + ".');" +
                           "</script>");
                        }
                        else if (myreader.IsClosed)
                        {
                            Response.Write("<script language='javascript'>" +
                               "window.alert('Reader Is closed..!!! Report Error');" +
                               "</script>");
                        }
                        /*
                        Response.Write("<script language='javascript'>" +
                        "window.alert('Student Data With Id:" + x_id + " is now obsolate..!! ');" +
                        "window.location='../sishu_bikas_model_school/manage_students#content_show.aspx';" +
                        "</script>");
                        */
                    }
                    else
                    {
                        Response.Write("<script language='javascript'>" +
                       "window.alert('Student Data With Id:" + x_id + " Could not be updated..!! Something went wrong..!! ');" +
                       "</script>");
                    }
                }
            }
            else
            {
                con.Close();
                cmd.CommandText = command2;
                con.Open();
                int s = cmd.ExecuteNonQuery();
                con.Close();
                if (s.Equals(1))
                {
                    cmd.CommandText = command3;
                    con.Open();

                    myreader = cmd.ExecuteReader();
                    if (myreader.HasRows && !myreader.IsClosed)
                    {
                        string x = "";
                        while (myreader.Read())
                        {
                            x = myreader["students_reg_id"].ToString();
                        }
                        con.Close();
                        Response.Write("<script language='javascript'>" +
                       "window.alert('Data Saved Successfully with Student Registration Number:" + x + " ');" +
                       "window.location='../sishu_bikas_model_school/manage_students#content_show.aspx';" +
                       "</script>");
                    }
                    else if (myreader.IsClosed)
                    {
                        Response.Write("<script language='javascript'>" +
                           "window.alert('Reader Is closed..!!! Report Error');" +
                           "</script>");
                    }
                }
            }
            initialize_send_strings();
            initialize_get_strings();
        }

        /*Checking if the applicant is an ex student of the school*/
        protected Boolean x_student_check(String x_students_reg_id_string)
        {
            Boolean b = false;
            try
            {
                con.Close();
                string command2 = "SELECT students_reg_id, name, contact_no1, contact_no2, dob FROM students WHERE name='" + name.Text + "' AND dob='" + dob.Text.ToString().Trim() +
                    "' AND (contact_no1='" + contact_no1.Text.ToString().Trim() + "' OR contact_no1='" + contact_no2.Text.ToString().Trim() +
                     "' OR contact_no2='" + contact_no1.Text.ToString().Trim() + "' OR contact_no2='" + contact_no2.Text.ToString().Trim() +
                     "' OR email_id='" + emailid.Text.ToString().Trim() + "') AND tc = 1 AND obsolate = 0";
                cmd.CommandText = command2;
                /* cmd.CommandText = command2*/
                con.Open();
                myreader = cmd.ExecuteReader();
                int row_count = 0;
                DataTable dt = new DataTable();
                dt.Load(myreader);
                row_count = dt.Rows.Count;
                dt.Dispose();
                myreader.Close();
                myreader = cmd.ExecuteReader();
                if (myreader.HasRows)
                {
                    while (myreader.Read())
                    {
                        x_students_reg_id_string = myreader["students_reg_id"].ToString();
                    }
                    b = true;
                }
                else
                {
                    b = false;
                }
                xstudent_check.Checked = b;
                x_students_id.Visible = b;
                x_students_reg_id_label.Visible = b;
                x_students_id.ReadOnly = b;
                if (b)
                {
                    x_students_id.Text = x_students_reg_id_string;
                }
            }
            catch (Exception x_student_check_error)
            {
                Response.Write("<script language='javascript'>" +
                    "window.alert('" + x_student_check_error.Message + "');" +
                    "</script>");
            }
            return b;
        }

        /*Checking if permanent address fields are all filled up*/
        protected Boolean addsection_permanentaddress_field_check()
        {
            if (pad_hno.Text.Equals(null)|| pad_hno.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('House/Road Name Cannot Be empty');" +
                       "</script>");
                pad_hno.Focus();
                return false;
            }
            else if(pad_area.Text.Equals(string.Empty) || pad_area.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Village Or Area Address Cannot Be empty');" +
                       "</script>");
                pad_area.Focus();
                return false;
            }
            else if (pad_city.Text.Equals(null) || pad_city.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('City Name Cannot Be empty');" +
                       "</script>");
                pad_city.Focus();
                return false;
            }
            else if (pad_pin.Text.Equals(string.Empty) || pad_pin.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Pin Cannot Be empty');" +
                       "</script>");
                pad_pin.Focus();
                return false;
            }
            else if (pad_district.Text.Equals(null) || pad_district.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('District Name Cannot Be empty');" +
                       "</script>");
                pad_district.Focus();
                return false;
            }
            else if (pad_state.Text.Equals(string.Empty) || pad_state.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('State Name Cannot Be empty');" +
                       "</script>");
                pad_state.Focus();
                return false;
            }
            else
            {
                return true;
            }
        }

        /*Checking compulsory fields are filled up*/
        protected Boolean addsection_other_field_check()
        {
            if (name.Text.Equals(null) || name.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Sutdent Name Cannot Be empty..!!');" +
                       "</script>");
                name.Focus();
                return false;
            }
            else if (guardian_name.Text.Equals(string.Empty) || guardian_name.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Guardian Name Cannot Be empty..!!');" +
                       "</script>");
                guardian_name.Focus();
                return false;
            }
            else if (contact_no1.Text.Equals(null) || contact_no1.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Contact Number Cannot Be empty...!!!');" +
                       "</script>");
                contact_no1.Focus();
                return false;
            }
            else if (contact_no2.Text.Equals(string.Empty) || contact_no2.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Contact Number Cannot Be empty..!!');" +
                       "</script>");
                contact_no2.Focus();
                return false;
            }
            else if (pad_district.Text.Equals(null) || pad_district.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('District Name Cannot Be empty..!!');" +
                       "</script>");
                pad_district.Focus();
                return false;
            }
            else if (pad_state.Text.Equals(string.Empty) || pad_state.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('State Name Cannot Be empty..!!');" +
                       "</script>");
                pad_state.Focus();
                return false;
            }
            else
            {
                return true;
            }
        }


        /*
         * 
         * Edit Section
         * 
         */


        protected void edit_student_Click(object sender, EventArgs e)
        {
            add.Visible = false;
            edit.Visible = true;
            add_student.BorderColor = System.Drawing.ColorTranslator.FromHtml("#c0c0c0");
            add_student.BackColor = System.Drawing.ColorTranslator.FromHtml("#c0c0c0");
            edit_student.BorderColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
            edit_student.BackColor = System.Drawing.ColorTranslator.FromHtml("#0066FF");
            ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#content_show';", true);
            onpageload_edit();
            initialize_get_strings();
            initialize_send_strings();
        }

        protected void e_id_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            on_id_ddl_select_fetch_data();
        }

        protected void e_religion_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (e_religion_ddl.SelectedItem.Text.Equals("Others"))
            {
                e_religion_other.Visible = true;
            }
            else
            {
                e_religion_other.Visible = false;
            }
        }

        protected void e_blood_group_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (e_blood_group_ddl.SelectedItem.Text.Equals("Others"))
            {
                e_blood_group_other.Visible = true;
            }
            else
            {
                e_blood_group_other.Visible = false;
            }
        }

        protected void e_caste_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (e_caste_ddl.SelectedItem.Text.Equals("Others"))
            {
                e_caste_other.Visible = true;
            }
            else
            {
                e_caste_other.Visible = false;
            }
        }

        protected void e_pad_to_lad_sync_CheckedChanged(object sender, EventArgs e)
        {
            if (e_pad_to_lad_sync.Checked.Equals(true))
            {
                if (e_addsection_permanentaddress_field_check())
                {
                    e_instructon_for_pad_to_lad_sync.Visible = true;

                    e_lad_hno.Text = e_pad_hno.Text;
                    e_lad_area.Text = e_pad_area.Text;
                    e_lad_city.Text = e_pad_city.Text;
                    e_lad_pin.Text = e_pad_pin.Text;
                    e_lad_district.Text = e_pad_district.Text;
                    e_lad_state.Text = e_pad_state.Text;

                    e_pad_hno.ReadOnly = true;
                    e_pad_area.ReadOnly = true;
                    e_pad_city.ReadOnly = true;
                    e_pad_pin.ReadOnly = true;
                    e_pad_district.ReadOnly = true;
                    e_pad_state.ReadOnly = true;

                    e_lad_hno.ReadOnly = true;
                    e_lad_area.ReadOnly = true;
                    e_lad_city.ReadOnly = true;
                    e_lad_pin.ReadOnly = true;
                    e_lad_district.ReadOnly = true;
                    e_lad_state.ReadOnly = true;
                }
                else
                {
                    e_instructon_for_pad_to_lad_sync.Visible = false;

                    e_lad_hno.Text = string.Empty;
                    e_lad_area.Text = string.Empty;
                    e_lad_city.Text = string.Empty;
                    e_lad_pin.Text = string.Empty;
                    e_lad_district.Text = string.Empty;
                    e_lad_state.Text = string.Empty;

                    e_pad_hno.ReadOnly = false;
                    e_pad_area.ReadOnly = false;
                    e_pad_city.ReadOnly = false;
                    e_pad_pin.ReadOnly = false;
                    e_pad_district.ReadOnly = false;
                    e_pad_state.ReadOnly = false;

                    e_lad_hno.ReadOnly = false;
                    e_lad_area.ReadOnly = false;
                    e_lad_city.ReadOnly = false;
                    e_lad_pin.ReadOnly = false;
                    e_lad_district.ReadOnly = false;
                    e_lad_state.ReadOnly = false;

                    e_pad_to_lad_sync.Checked = false;
                }
            }
            else
            {
                e_instructon_for_pad_to_lad_sync.Visible = false;

                e_lad_hno.Text = string.Empty;
                e_lad_area.Text = string.Empty;
                e_lad_city.Text = string.Empty;
                e_lad_pin.Text = string.Empty;
                e_lad_district.Text = string.Empty;
                e_lad_state.Text = string.Empty;

                e_lad_hno.ReadOnly = false;
                e_lad_area.ReadOnly = false;
                e_lad_city.ReadOnly = false;
                e_lad_pin.ReadOnly = false;
                e_lad_district.ReadOnly = false;
                e_lad_state.ReadOnly = false;

                e_pad_hno.ReadOnly = false;
                e_pad_area.ReadOnly = false;
                e_pad_city.ReadOnly = false;
                e_pad_pin.ReadOnly = false;
                e_pad_district.ReadOnly = false;
                e_pad_state.ReadOnly = false;
            }
        }

        protected void e_transferred_parameter_CheckedChanged(object sender, EventArgs e)
        {
            e_transfer_field.Visible = e_transferred_parameter.Checked;
        }

        protected void e_xstudent_check_CheckedChanged(object sender, EventArgs e)
        {
            e_x_students_reg_id.Visible = e_xstudent_check.Checked;
            e_x_students_reg_id_label.Visible = e_xstudent_check.Checked;
        }

        protected void update_data_Click(object sender, EventArgs e)
        {
            update_student_details();
        }

        protected void delete_data_Click(object sender, EventArgs e)
        {
            delete_student();
        }

        /*
         * 
         * FUNCTIONS FOR IMPLEMENTATION
         * 
         */

        /*Functions to be executed on pageload in edit section*/
        protected void onpageload_edit()
        {
            religion_ddl.Items.Clear();
            blood_group_ddl.Items.Clear();
            caste_ddl.Items.Clear();
            e_religion_ddl.Items.Clear();
            e_blood_group_ddl.Items.Clear();
            e_caste_ddl.Items.Clear();
            e_id_ddl.Items.Clear();
            e_get_religion_data();
            e_get_blood_group_data();
            e_get_caste_data();
            e_get_student_ids();
        }

        /*Populating Students IDs And Names In Drop Down List*/
        protected void e_get_student_ids()
        {
            string spaces = Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;");
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Student Registration Id-";
            newItem.Value = "0";
            e_id_ddl.Items.Add(newItem);
            try
            {
                con.Close();
                cmd.CommandText = "SELECT students_reg_id, name FROM students WHERE tc = 0";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text =  myreader["students_reg_id"].ToString()+ spaces+ spaces + spaces + myreader["name"].ToString();
                    newItem1.Value = myreader["students_reg_id"].ToString();
                    e_id_ddl.Items.Add(newItem1);
                }
                con.Close();
            }
            catch (Exception e_error_religion_fetch)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + e_error_religion_fetch.Message + "');" +
                       "</script>");
            }
        }

        /*Populating religion in drop down list in edit section*/
        protected void e_get_religion_data()
        {
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Item-";
            newItem.Value = "0";
            e_religion_ddl.Items.Add(newItem);
            try
            {
                con.Close();
                cmd.CommandText = "SELECT DISTINCT religion FROM students";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text = myreader["religion"].ToString();
                    newItem1.Value = myreader["religion"].ToString();
                    e_religion_ddl.Items.Add(newItem1);
                }
                con.Close();
                ListItem newItem2 = new ListItem();
                newItem2.Text = "Others";
                newItem2.Value = "others";
                e_religion_ddl.Items.Add(newItem2);
            }
            catch (Exception e_error_religion_fetch)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + e_error_religion_fetch.Message + "');" +
                       "</script>");
            }
        }

        /*Populating blood group in drop down list in edit section*/
        protected void e_get_blood_group_data()
        {
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Item-";
            newItem.Value = "0";
            e_blood_group_ddl.Items.Add(newItem);
            try
            {
                con.Close();
                cmd.CommandText = "SELECT DISTINCT blood_group FROM students";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text = myreader["blood_group"].ToString();
                    newItem1.Value = myreader["blood_group"].ToString();
                    e_blood_group_ddl.Items.Add(newItem1);
                }
                con.Close();
                ListItem newItem2 = new ListItem();
                newItem2.Text = "Others";
                newItem2.Value = "others";
                e_blood_group_ddl.Items.Add(newItem2);
            }
            catch (Exception e_error_blood_group_fetch)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + e_error_blood_group_fetch.Message + "');" +
                       "</script>");
            }
        }

        /*Populating caste in drop down list in edit section*/
        protected void e_get_caste_data()
        {
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Item-";
            newItem.Value = "0";
            e_caste_ddl.Items.Add(newItem);
            try
            {
                con.Close();
                cmd.CommandText = "SELECT DISTINCT caste FROM students";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text = myreader["caste"].ToString();
                    newItem1.Value = myreader["caste"].ToString();
                    e_caste_ddl.Items.Add(newItem1);
                }
                con.Close();
                ListItem newItem2 = new ListItem();
                newItem2.Text = "Others";
                newItem2.Value = "others";
                e_caste_ddl.Items.Add(newItem2);
            }
            catch (Exception e_error_caste_fetch)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + e_error_caste_fetch.Message + "');" +
                       "</script>");
            }
        }

        /*Setting strings to default empty*/
        protected void set_strings_to_defaul_empty()
        {
            g_name = string.Empty;
            g_religion = "0";
            g_gender = "0";
            g_blood_group = "0";
            g_caste = "0";
            g_dob = DateTime.Parse(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
            g_f_name = string.Empty;
            g_m_name = string.Empty;
            g_g_name = string.Empty;
            //permanent address
            g_pad_hno = string.Empty;
            g_pad_area = string.Empty;
            g_pad_city = string.Empty;
            g_pad_pin = string.Empty;
            g_pad_dist = string.Empty;
            g_pad_state = string.Empty;
            //local address
            g_lad_hno = string.Empty;
            g_lad_area = string.Empty;
            g_lad_city = string.Empty;
            g_lad_pin = string.Empty;
            g_lad_dist = string.Empty;
            g_lad_state = string.Empty;
            //contact details
            g_con_no1 = string.Empty;
            g_con_no2 = string.Empty;
            g_emailid = string.Empty;
            //addmission details
            g_admission_dt = DateTime.Parse(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
            g_tc_from = string.Empty;
            g_note = string.Empty;
            g_tc_to = string.Empty;
            g_tc_date = DateTime.Parse(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
            g_tc = "false";
            g_x_students_reg_id = string.Empty;

            //modifier details
            g_update_time = DateTime.Now.ToShortDateString();
            g_updated_by = string.Empty;

            get_data_to_page();
        }

        /*On Student Id Selection Fetching Data to Strings Related to that students*/
        protected void on_id_ddl_select_fetch_data()
        {
            if (!e_id_ddl.SelectedItem.Value.Equals("0"))
            {
                string student_id = e_id_ddl.SelectedItem.Value.ToString();
                fetch_student_data(student_id);
            }
            else
            {
                set_strings_to_defaul_empty();
            }
        }

        /*fetching individual data in edit section*/
        protected void fetch_student_data(string student_id)
        {
            g_student_id = student_id;
            cmd.CommandText = "SELECT * FROM students WHERE students_reg_id='" + g_student_id + "'";
            con.Open();
            myreader = cmd.ExecuteReader();
            if (myreader.HasRows)
            {

                while (myreader.Read())
                {
                    //Basic Info
                    g_name = myreader["name"].ToString();
                    g_religion = myreader["religion"].ToString();
                    g_gender = myreader["gender"].ToString();
                    g_blood_group = myreader["blood_group"].ToString();
                    g_caste = myreader["caste"].ToString();
                    if (myreader["dob"].ToString().Equals(null) || myreader["dob"].ToString().Equals(string.Empty))
                    {
                        g_dob = DateTime.Parse(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        g_dob = DateTime.Parse(myreader["dob"].ToString()).ToString("yyyy-MM-dd");
                    }
                    g_f_name = myreader["father_name"].ToString();
                    g_m_name = myreader["mother_name"].ToString();
                    g_g_name = myreader["guardian_name"].ToString();
                    //permanent address
                    g_pad_hno = myreader["p_address_hno"].ToString();
                    g_pad_area = myreader["p_address_area"].ToString();
                    g_pad_city = myreader["p_address_city"].ToString();
                    g_pad_pin = myreader["p_address_pin"].ToString();
                    g_pad_dist = myreader["p_address_dist"].ToString();
                    g_pad_state = myreader["p_address_state"].ToString();
                    //local address
                    g_lad_hno = myreader["l_address_hno"].ToString();
                    g_lad_area = myreader["l_address_area"].ToString();
                    g_lad_city = myreader["l_address_city"].ToString();
                    g_lad_pin = myreader["l_address_pin"].ToString();
                    g_lad_dist = myreader["l_address_dist"].ToString();
                    g_lad_state = myreader["l_address_state"].ToString();
                    //contact details
                    g_con_no1 = myreader["contact_no1"].ToString();
                    g_con_no2 = myreader["contact_no2"].ToString();
                    g_emailid = myreader["email_id"].ToString();
                    //addmission details
                    g_admission_dt = DateTime.Parse(myreader["admission_date"].ToString()).ToString("yyyy-MM-dd");
                    g_tc_from = myreader["tc_from"].ToString();
                    g_note = myreader["note"].ToString();
                    g_tc = Boolean.Parse(myreader["tc"].ToString()).ToString();
                    g_tc_to = myreader["tc_to"].ToString();
                    if (myreader["tc_date"].ToString().Equals(null) || myreader["tc_date"].ToString().Equals(string.Empty))
                    {
                        g_tc_date = DateTime.Parse(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        g_tc_date = DateTime.Parse(myreader["tc_date"].ToString()).ToString("yyyy-MM-dd");
                    }
                    g_tc = myreader["tc"].ToString();
                    g_x_students_reg_id = myreader["x_students_reg_id"].ToString();

                    //modifier details
                    if (myreader["update_time"].ToString().Equals(null) || myreader["update_time"].ToString().Equals(string.Empty))
                    {
                        g_update_time = DateTime.Parse(DateTime.Now.ToShortDateString()).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        g_update_time = DateTime.Parse(myreader["update_time"].ToString()).ToString("yyyy-MM-dd");
                    }
                    g_updated_by = myreader["updated_by"].ToString();
                }
            }
            con.Close();
            get_data_to_page();
        }

        /*Clearing Data From Edit Page*/
        protected void clear_page_data()
        {
            e_gender_ddl.ClearSelection();
            e_religion_ddl.ClearSelection();
            e_blood_group_ddl.ClearSelection();
            e_caste_ddl.ClearSelection();
            onpageload_edit();
            set_strings_to_defaul_empty();
        }

        /*Loading Data to form from strings*/
        protected void get_data_to_page()
        {
            e_gender_ddl.ClearSelection();
            e_religion_ddl.ClearSelection();
            e_blood_group_ddl.ClearSelection();
            e_caste_ddl.ClearSelection();
            
            //Basic Info
            e_name.Text = g_name;
            e_religion_ddl.Items.FindByValue(g_religion).Selected = true;
            e_gender_ddl.Items.FindByValue(g_gender).Selected = true;
            e_blood_group_ddl.Items.FindByValue(g_blood_group).Selected = true;
            e_caste_ddl.Items.FindByValue(g_caste).Selected = true;
            e_dob.Text = g_dob;
            e_father_name.Text = g_f_name;
            e_mother_name.Text = g_m_name;
            e_guardian_name.Text = g_g_name;

            //permanent address
            e_pad_hno.Text = g_pad_hno;
            e_pad_area.Text = g_pad_area;
            e_pad_city.Text = g_pad_city;
            e_pad_pin.Text = g_pad_pin;
            e_pad_district.Text = g_pad_dist;
            e_pad_state.Text = g_pad_state;

            //local address
            e_lad_hno.Text = g_lad_hno;
            e_lad_area.Text = g_lad_area;
            e_lad_city.Text = g_lad_city;
            e_lad_pin.Text = g_lad_pin;
            e_lad_district.Text = g_lad_dist;
            e_lad_state.Text = g_lad_state;

            if (g_pad_hno.Equals(g_lad_hno) && g_pad_area.Equals(g_lad_area) && g_pad_city.Equals(g_lad_city) && 
                g_pad_pin.Equals(g_lad_pin) && g_pad_dist.Equals(g_lad_dist) && g_pad_state.Equals(g_lad_state) &&
                !g_pad_hno.Equals(string.Empty) && !g_pad_area.Equals(string.Empty) && !g_pad_city.Equals(string.Empty) &&
                !g_pad_pin.Equals(string.Empty) && !g_pad_dist.Equals(string.Empty) && !g_pad_state.Equals(string.Empty))
            {
                e_pad_to_lad_sync.Checked = true;
                e_instructon_for_pad_to_lad_sync.Visible = true;

                e_pad_hno.ReadOnly = true;
                e_pad_area.ReadOnly = true;
                e_pad_city.ReadOnly = true;
                e_pad_pin.ReadOnly = true;
                e_pad_district.ReadOnly = true;
                e_pad_state.ReadOnly = true;

                e_lad_hno.ReadOnly = true;
                e_lad_area.ReadOnly = true;
                e_lad_city.ReadOnly = true;
                e_lad_pin.ReadOnly = true;
                e_lad_district.ReadOnly = true;
                e_lad_state.ReadOnly = true;
            }
            else
            {
                e_pad_to_lad_sync.Checked = false;
                e_instructon_for_pad_to_lad_sync.Visible = false;

                e_pad_hno.ReadOnly = false;
                e_pad_area.ReadOnly = false;
                e_pad_city.ReadOnly = false;
                e_pad_pin.ReadOnly = false;
                e_pad_district.ReadOnly = false;
                e_pad_state.ReadOnly = false;

                e_lad_hno.ReadOnly = false;
                e_lad_area.ReadOnly = false;
                e_lad_city.ReadOnly = false;
                e_lad_pin.ReadOnly = false;
                e_lad_district.ReadOnly = false;
                e_lad_state.ReadOnly = false;
            }

            //contact details
            e_contact_no1.Text = g_con_no1;
            e_contact_no2.Text = g_con_no2;
            e_emailid.Text = g_emailid;

            //addmission details
            e_admission_date.Text = g_admission_dt;
            e_tc_from.Text = g_tc_from;
            e_note.Text = g_note;
            e_xstudent_check.Checked = !g_x_students_reg_id.Equals(string.Empty);
            e_x_students_reg_id.Visible = !g_x_students_reg_id.Equals(string.Empty);
            e_x_students_reg_id.Text = g_x_students_reg_id;

            e_transferred_parameter.Checked = Boolean.Parse(g_tc);
            e_transfer_field.Visible = Boolean.Parse(g_tc);
            e_tc_to.Text = g_tc_to;
            e_tc_date.Text = g_tc_date;
        }

        /*Delete student function*/
        protected void delete_student()
        {
            string id_for_delete = e_id_ddl.SelectedItem.Value;
            string command1 = "DELETE FROM students WHERE students_reg_id = '"+id_for_delete+"'";
            cmd.CommandText = command1;
            try
            {
                con.Close();
                con.Open();
                int r = cmd.ExecuteNonQuery();
                con.Close();
                if (r.Equals(1))
                {
                    string x = e_id_ddl.SelectedItem.Value;
                    clear_page_data();
                    Response.Write("<script language='javascript'>" +
                               "window.alert('Data with Student Registration Number:" + x + " has been deleted successfully..!!');" +
                               "window.location='../sishu_bikas_model_school/manage_students#content_show.aspx';" +
                               "</script>");
                }
                else
                {
                    Response.Write("<script language='javascript'>" +
                               "window.alert('Something went wrong while deleting data..!! Call For Support..!!');" +
                               "</script>");
                }
            }
            catch (Exception delete_student_error)
            {
                Response.Write("<script language='javascript'>" +
                               "window.alert('Something went wrong while deleting data..!! Call For Support..!!\\n Error Message: "+delete_student_error.Message+"');" +
                               "</script>");
            }
        }

        /*Checking all fields of permanent address is filled up in edit section*/
        protected Boolean e_addsection_permanentaddress_field_check()
        {
            if (e_pad_hno.Text.Equals(null) || e_pad_hno.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('House/Road Name Cannot Be empty');" +
                       "</script>");
                e_pad_hno.Focus();
                return false;
            }
            else if (e_pad_area.Text.Equals(string.Empty) || e_pad_area.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Village Or Area Address Cannot Be empty');" +
                       "</script>");
                e_pad_area.Focus();
                return false;
            }
            else if (e_pad_city.Text.Equals(null) || e_pad_city.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('City Name Cannot Be empty');" +
                       "</script>");
                pad_city.Focus();
                return false;
            }
            else if (e_pad_pin.Text.Equals(string.Empty) || e_pad_pin.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Pin Cannot Be empty');" +
                       "</script>");
                pad_pin.Focus();
                return false;
            }
            else if (e_pad_district.Text.Equals(null) || e_pad_district.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('District Name Cannot Be empty');" +
                       "</script>");
                e_pad_district.Focus();
                return false;
            }
            else if (e_pad_state.Text.Equals(string.Empty) || e_pad_state.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('State Name Cannot Be empty');" +
                       "</script>");
                e_pad_state.Focus();
                return false;
            }
            else
            {
                return true;
            }
        }

        /*Checking compulsory fields are filled up in edit section*/
        protected Boolean e_editsection_other_field_check()
        {
            if (e_name.Text.Equals(null) || e_name.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Sutdent Name Cannot Be empty..!!');" +
                       "</script>");
                name.Focus();
                return false;
            }
            else if (e_guardian_name.Text.Equals(string.Empty) || e_guardian_name.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Guardian Name Cannot Be empty..!!');" +
                       "</script>");
                e_guardian_name.Focus();
                return false;
            }
            else if (e_contact_no1.Text.Equals(null) || e_contact_no1.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Contact Number Cannot Be empty...!!!');" +
                       "</script>");
                e_contact_no1.Focus();
                return false;
            }
            else if (e_contact_no2.Text.Equals(string.Empty) || e_contact_no2.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Contact Number Cannot Be empty..!!');" +
                       "</script>");
                e_contact_no2.Focus();
                return false;
            }
            else if (e_pad_district.Text.Equals(null) || e_pad_district.Text.Equals(string.Empty))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('District Name Cannot Be empty..!!');" +
                       "</script>");
                e_pad_district.Focus();
                return false;
            }
            else if (e_pad_state.Text.Equals(string.Empty) || e_pad_state.Text.Equals(null))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('State Name Cannot Be empty..!!');" +
                       "</script>");
                e_pad_state.Focus();
                return false;
            }
            else if (Boolean.Parse(s_tc))
            {
                if (s_tc_date.Equals(string.Empty))
                {
                    Response.Write("<script language='javascript'>" +
                       "window.alert('TC Date Cannot Be empty..!!"+e_tc_date.Text+"');" +
                       "</script>");
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }

        /*getting data from form to input strings for edit*/
        protected void e_get_data_to_s_string()
        {
            //basic details
            s_student_id = e_id_ddl.SelectedItem.Value;
            s_name = e_name.Text;
            s_gender = e_gender_ddl.SelectedItem.Text;
            s_dob = e_dob.Text;
            s_f_name = e_father_name.Text;
            s_m_name = e_mother_name.Text;
            s_g_name = e_guardian_name.Text;
            if (e_religion_ddl.SelectedItem.Text.Equals("Others"))
            {
                s_religion = e_religion_other.Text;
            }
            else if (e_religion_ddl.SelectedItem.Value.Equals("0"))
            {
                s_religion = string.Empty;
            }
            else
            {
                s_religion = e_religion_ddl.SelectedItem.Text;
            }
            if (e_blood_group_ddl.SelectedItem.Text.Equals("Others"))
            {
                s_blood_group = e_blood_group_other.Text;
            }
            else if (e_blood_group_ddl.SelectedItem.Value.Equals("0"))
            {
                s_blood_group = string.Empty;
            }
            else
            {
                s_blood_group = e_blood_group_ddl.SelectedItem.Text;
            }
            if (e_caste_ddl.SelectedItem.Text.Equals("Others"))
            {
                s_caste = e_caste_other.Text;
            }
            else if (e_caste_ddl.SelectedItem.Value.Equals("0"))
            {
                s_caste = string.Empty;
            }
            else
            {
                s_caste = e_caste_ddl.SelectedItem.Text;
            }

            //address details
            //permanent address
            s_pad_hno = e_pad_hno.Text;
            s_pad_area = e_pad_area.Text;
            s_pad_city = e_pad_city.Text;
            s_pad_pin = e_pad_pin.Text;
            s_pad_dist = e_pad_district.Text;
            s_pad_state = e_pad_state.Text;
            //local addess
            s_lad_hno = e_lad_hno.Text;
            s_lad_area = e_lad_area.Text;
            s_lad_city = e_lad_city.Text;
            s_lad_pin = e_lad_pin.Text;
            s_lad_dist = e_lad_district.Text;
            s_lad_state = e_lad_state.Text;
            //contact details
            s_con_no1 = e_contact_no1.Text;
            s_con_no2 = e_contact_no2.Text;
            s_emailid = e_emailid.Text;
            //admission details
            //this portion is not for editing.
            /*
            admission_time = DateTime.Parse(e_admission_date.Text);
            s_admission_dt = admission_time.Date.ToShortDateString();
            s_admission_tm = admission_time.Date.ToShortTimeString();
            s_tc_from = tc_from.Text;*/
            if (e_transferred_parameter.Checked.Equals(true))
            {
                s_tc = true.ToString();
                s_tc_to = e_tc_to.Text;
                //s_tc_date = string.Empty;
                s_tc_date = e_tc_date.Text;
            }
            else
            {
                s_tc = false.ToString();
            }

            s_note = e_note.Text;
            if (e_xstudent_check.Checked)
            {
                s_x_students_reg_id = e_x_students_reg_id.Text;
            }
            else
            {
                s_x_students_reg_id = string.Empty;
            }
            s_update_time = DateTime.Now.ToString();
            s_updated_by = "admin";
        }

        /*Comparing data with new data*/
        protected Boolean data_comparison()
        {
            if (s_student_id.Equals(g_student_id) && s_name.Equals(g_name) && s_dob.Equals(g_dob) && s_gender.Equals(g_gender) && s_blood_group.Equals(g_blood_group) &&
                s_religion.Equals(g_religion) && s_caste.Equals(g_caste) && s_f_name.Equals(g_f_name) && s_m_name.Equals(g_m_name) && s_g_name.Equals(g_g_name) &&
                s_pad_hno.Equals(g_pad_hno) && s_pad_area.Equals(g_pad_area) && s_pad_city.Equals(g_pad_city) && s_pad_pin.Equals(g_pad_pin) && s_pad_dist.Equals(g_pad_dist) &&
                s_pad_state.Equals(g_pad_state) && s_lad_hno.Equals(g_lad_hno) && s_lad_area.Equals(g_lad_area) && s_lad_city.Equals(g_lad_city) && s_lad_pin.Equals(g_lad_pin) &&
                s_lad_dist.Equals(g_lad_dist) && s_lad_state.Equals(g_lad_state) && s_con_no1.Equals(g_con_no1) && s_con_no2.Equals(g_con_no2) && s_emailid.Equals(g_emailid) &&
                s_tc_from.Equals(g_tc_from) && s_note.Equals(g_note) && s_x_students_reg_id.Equals(g_x_students_reg_id) && s_tc.Equals(g_tc) && s_tc_date.Equals(g_tc_date) &&
                s_tc_to.Equals(g_tc_to) && s_tc_date.Equals(g_tc_date))
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('Can Not Update Data As Nothing Has Changed..!!');" +
                       "</script>");
                return false;
            }
            else
            {
                return true;
            }
        }

        /*Update data*/
        protected void update_student_details()
        {
            e_get_data_to_s_string();

            string command1 = "UPDATE students SET " +
            "name='" + s_name + "', dob='" + s_dob + "', gender='" + s_gender + "', blood_group='" + s_blood_group + "', " +
            "religion='" + s_religion + "', caste='" + s_caste + "', father_name='" + s_f_name + "', mother_name='" + s_m_name + "', guardian_name='" + s_g_name + "', " +
            "p_address_hno='" + s_pad_hno + "', p_address_area='" + s_pad_area + "', p_address_city='" + s_pad_city + "', " +
            "p_address_pin='" + s_pad_pin + "', p_address_dist='" + s_pad_dist + "', p_address_state='" + s_pad_state + "', " +
            "l_address_hno='" + s_lad_hno + "', l_address_area='" + s_lad_area + "', l_address_city='" + s_lad_city + "', " +
            "l_address_pin='" + s_lad_pin + "', l_address_dist='" + s_lad_dist + "', l_address_state='" + s_lad_state + "', " +
            "contact_no1='" + s_con_no1 + "', contact_no2='" + s_con_no2 + "', email_id='" + s_emailid + "', tc_from='" + s_tc_from + "', " +
            "note='" + s_note + "', tc='" + s_tc + "', tc_to='" + s_tc_to + "', tc_date='" + s_tc_date + "', " +
            "update_time='" + s_update_time + "', updated_by='" + s_updated_by + "' " +
            "WHERE " +
            "students_reg_id='" + s_student_id + "'";

            string command2 = "UPDATE students SET " +
            "name='" + s_name + "', dob='" + s_dob + "', gender='" + s_gender + "', blood_group='" + s_blood_group + "', " +
            "religion='" + s_religion + "', caste='" + s_caste + "', father_name='" + s_f_name + "', mother_name='" + s_m_name + "', guardian_name='" + s_g_name + "', " +
            "p_address_hno='" + s_pad_hno + "', p_address_area='" + s_pad_area + "', p_address_city='" + s_pad_city + "', " +
            "p_address_pin='" + s_pad_pin + "', p_address_dist='" + s_pad_dist + "', p_address_state='" + s_pad_state + "', " +
            "l_address_hno='" + s_lad_hno + "', l_address_area='" + s_lad_area + "', l_address_city='" + s_lad_city + "', " +
            "l_address_pin='" + s_lad_pin + "', l_address_dist='" + s_lad_dist + "', l_address_state='" + s_lad_state + "', " +
            "contact_no1='" + s_con_no1 + "', contact_no2='" + s_con_no2 + "', email_id='" + s_emailid + "', tc_from='" + s_tc_from + "', " +
            "note='" + s_note + "', x_students_reg_id='" + s_x_students_reg_id + "', tc='" + s_tc + "', tc_to='" + s_tc_to + "', tc_date='" + s_tc_date + "', " +
            "update_time='" + s_update_time + "', updated_by='" + s_updated_by + "' " +
            "WHERE " +
            "students_reg_id='" + s_student_id + "'";

            string command3 = "UPDATE students SET " +
            "name='" + s_name + "', dob='" + s_dob + "', gender='" + s_gender + "', blood_group='" + s_blood_group + "', " +
            "religion='" + s_religion + "', caste='" + s_caste + "', father_name='" + s_f_name + "', mother_name='" + s_m_name + "', guardian_name='" + s_g_name + "', " +
            "p_address_hno='" + s_pad_hno + "', p_address_area='" + s_pad_area + "', p_address_city='" + s_pad_city + "', " +
            "p_address_pin='" + s_pad_pin + "', p_address_dist='" + s_pad_dist + "', p_address_state='" + s_pad_state + "', " +
            "l_address_hno='" + s_lad_hno + "', l_address_area='" + s_lad_area + "', l_address_city='" + s_lad_city + "', " +
            "l_address_pin='" + s_lad_pin + "', l_address_dist='" + s_lad_dist + "', l_address_state='" + s_lad_state + "', " +
            "contact_no1='" + s_con_no1 + "', contact_no2='" + s_con_no2 + "', email_id='" + s_emailid + "', tc_from='" + s_tc_from + "', " +
            "note='" + s_note + "', x_students_reg_id='" + s_x_students_reg_id + "', update_time='" + s_update_time + "', updated_by='" + s_updated_by + "' " +
            "WHERE " +
            "students_reg_id='" + s_student_id + "'";

            string command4 = "UPDATE students SET " +
            "name='" + s_name + "', dob='" + s_dob + "', gender='" + s_gender + "', blood_group='" + s_blood_group + "', " +
            "religion='" + s_religion + "', caste='" + s_caste + "', father_name='" + s_f_name + "', mother_name='" + s_m_name + "', guardian_name='" + s_g_name + "', " +
            "p_address_hno='" + s_pad_hno + "', p_address_area='" + s_pad_area + "', p_address_city='" + s_pad_city + "', " +
            "p_address_pin='" + s_pad_pin + "', p_address_dist='" + s_pad_dist + "', p_address_state='" + s_pad_state + "', " +
            "l_address_hno='" + s_lad_hno + "', l_address_area='" + s_lad_area + "', l_address_city='" + s_lad_city + "', " +
            "l_address_pin='" + s_lad_pin + "', l_address_dist='" + s_lad_dist + "', l_address_state='" + s_lad_state + "', " +
            "contact_no1='" + s_con_no1 + "', contact_no2='" + s_con_no2 + "', email_id='" + s_emailid + "', tc_from='" + s_tc_from + "', " +
            "note='" + s_note + "', update_time='" + s_update_time + "', updated_by='" + s_updated_by + "' " +
            "WHERE " +
            "students_reg_id='" + s_student_id + "'";

            if (Boolean.Parse(s_tc) && s_x_students_reg_id.Equals(string.Empty))
            {
                cmd.CommandText = command1;
            }
            else if (Boolean.Parse(s_tc) && !s_x_students_reg_id.Equals(string.Empty))
            {
                cmd.CommandText = command2;
            }
            else if (!Boolean.Parse(s_tc) && !s_x_students_reg_id.Equals(string.Empty))
            {
                cmd.CommandText = command3;
            }
            else if (!Boolean.Parse(s_tc) && s_x_students_reg_id.Equals(string.Empty))
            {
                cmd.CommandText = command4;
            }

            try
            {
                con.Close();
                if(data_comparison() && e_addsection_permanentaddress_field_check() && e_editsection_other_field_check())
                {
                    string id = s_student_id;
                    con.Open();
                    int r = cmd.ExecuteNonQuery();
                    con.Close();
                    if (r.Equals(1))
                    {
                        Response.Write("<script language='javascript'>" +
                       "window.alert('Data Updated Successfully');" +
                       "</script>");
                        e_id_ddl.ClearSelection();
                        e_id_ddl.Items.FindByValue(id).Selected=true;
                        initialize_get_strings();
                        fetch_student_data(s_student_id);
                        initialize_send_strings();
                    }
                    else
                    {
                        Response.Write("<script language='javascript'>" +
                               "window.alert('Something went wrong while updating data..!! Call For Support..!!');" +
                               "</script>");
                    }
                }
            }
            catch (Exception update_student_details_error)
            {
                Response.Write("<script language='javascript'>" +
                               "window.alert('Something went wrong while updating data..!! Call For Support..!!\\n Error Message: " + update_student_details_error.Message + "');" +
                               "</script>");
            }
        }
    }
}