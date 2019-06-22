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

    public partial class manage_subjects : System.Web.UI.Page
    {
       
        static string cs = ConfigurationManager.ConnectionStrings["sishubikashmodelschooldb"].ConnectionString;
        static SqlConnection con = new SqlConnection(cs);
        SqlDataReader myreader = null;
        SqlCommand cmd = new SqlCommand("", con);

        //add strings
        private string s_code, s_name, s_fmw, s_fmo, s_fmp;
        //edit strings
        private string s_code_e,s_name_e, s_fmw_e, s_fmo_e, s_fmp_e;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_subject_Click(object sender, EventArgs e)
        {
            add_section_open();
        }
        protected void edit_subject_Click(object sender, EventArgs e)
        {
            edit_section_open();
        }

        protected void subject_code_ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            dropdownitemchanged();
        }

        protected void add_confirm_Click(object sender, EventArgs e)
        {
            save_data();
        }

        protected void update_confirm_Click(object sender, EventArgs e)
        {
            update_data();
        }

        protected void delete_confirm_Click(object sender, EventArgs e)
        {
            delete_data();
        }

        //CODE SECTION
        protected void save_data()
        {
            con.Close();
            s_code = subject_code.Text;
            s_name = subject_name.Text;
            if (!full_marks_written.Text.Equals(string.Empty) || !full_marks_written.Text.Equals(null) || !full_marks_written.Text.Equals(""))
            {
                s_fmw = full_marks_written.Text;
            }
            else
            {
                s_fmw = null;
            }
            if (!full_marks_oral.Text.Equals(string.Empty) || !full_marks_oral.Text.Equals(null) || !full_marks_oral.Text.Equals(""))
            {
                s_fmo = full_marks_oral.Text;
            }
            else
            {
                s_fmo = null;
            }
            if (!full_marks_practical.Text.Equals(string.Empty) || !full_marks_practical.Text.Equals(null) || !full_marks_practical.Text.Equals(""))
            {
                s_fmp = full_marks_practical.Text;
            }
            else
            {
                s_fmp = null;
            }
            try
            {
                cmd.CommandText = "SELECT * FROM subjects where subject_code='" + s_code + "'";
                con.Open();
                myreader = cmd.ExecuteReader();

                if (myreader.HasRows)
                {
                    error.Visible = true;
                    con.Close();
                }
                else
                {
                    con.Close();
                    error.Visible = false;
                    cmd.CommandText = "INSERT INTO " +
                    "subjects (subject_code, subject_name, written, oral, practical) " +
                    "VALUES ('" + s_code + "','" + s_name + "','" + s_fmw + "','" + s_fmo + "','" + s_fmp + "')";

                    con.Open();
                    int r = cmd.ExecuteNonQuery();
                    con.Close();
                    if (r.Equals(1))
                    {
                        Response.Write("<script language='javascript'>" +
                        "window.alert('" + s_name + " with Subject Code " + s_code + " has been create successfully.');" +
                        "window.location='../sishu_bikas_model_school/manage_subjects.aspx';" +
                        "</script>");
                    }
                }
            }
            catch (Exception err)
            {
                Response.Write("<script language='javascript'>" +
                        "window.alert('" + err.Message + "');" +
                        "</script>");
            }
        }

        protected void add_section_open()
        {
            subject_code_ddl.Items.Clear();
            add.Visible = true;
            edit.Visible = false;
        }

        protected void edit_section_open()
        {
            subject_code_ddl.Items.Clear();
            ListItem newItem = new ListItem();
            newItem.Text = "-Select Item-";
            newItem.Value = string.Empty;
            subject_code_ddl.Items.Add(newItem);
            add.Visible = false;
            edit.Visible = true;
            try
            {
                con.Close();
                cmd.CommandText = "SELECT * FROM subjects";
                con.Open();
                myreader = null;
                myreader = cmd.ExecuteReader();
                while (myreader.Read())
                {
                    ListItem newItem1 = new ListItem();
                    newItem1.Text = myreader["subject_code"].ToString();
                    newItem1.Value = myreader["subject_name"].ToString();
                    subject_code_ddl.Items.Add(newItem1);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='javascript'>" +
                       "window.alert('" + ex.Message + "');" +
                       "</script>");
            }
        }

        protected void dropdownitemchanged()
        {
            if (subject_code_ddl.SelectedItem.Value != string.Empty)
            {

                try
                {
                    con.Close();
                    cmd.CommandText = "SELECT * FROM subjects WHERE subject_code='" + subject_code_ddl.SelectedItem.Text + "'";
                    con.Open();
                    myreader = null;
                    myreader = cmd.ExecuteReader();
                    while (myreader.Read())
                    {
                        update_subject_name.Text = myreader["subject_name"].ToString();
                        update_full_marks_written.Text = myreader["written"].ToString();
                        update_full_marks_oral.Text = myreader["oral"].ToString();
                        update_full_marks_practical.Text = myreader["practical"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script language='javascript'>" +
                           "window.alert('" + ex.Message + "');" +
                           "</script>");
                }
            }
        }

        protected void update_data()
        {
            s_code_e = subject_code_ddl.SelectedItem.Text;
            s_name_e = update_subject_name.Text;
            if (!update_full_marks_written.Text.Equals(string.Empty) || !update_full_marks_written.Text.Equals(null) || !update_full_marks_written.Text.Equals(""))
            {
                s_fmw_e = update_full_marks_written.Text;
            }
            else
            {
                s_fmw_e = null;
            }
            if (!update_full_marks_oral.Text.Equals(string.Empty) || !update_full_marks_oral.Text.Equals(null) || !update_full_marks_oral.Text.Equals(""))
            {
                s_fmo_e = update_full_marks_oral.Text;
            }
            else
            {
                s_fmo_e = null;
            }
            if (!update_full_marks_practical.Text.Equals(string.Empty) || !update_full_marks_practical.Text.Equals(null) || !update_full_marks_practical.Text.Equals(""))
            {
                s_fmp_e = update_full_marks_practical.Text;
            }
            else
            {
                s_fmp_e = null;
            }
            con.Close();
            error.Visible = false;
            cmd.CommandText = "UPDATE subjects" +
            "SET " +
            "subject_name='"+s_name_e+"', written='"+ s_fmw_e + "', oral='" + s_fmo_e + "', practical='" + s_fmp_e + "' " +
            "WHERE " +
            "subject_code='"+s_code_e+"'";

            con.Open();
            int r = cmd.ExecuteNonQuery();
            con.Close();
            if (r.Equals(1))
            {
                Response.Write("<script language='javascript'>" +
                "window.alert('Subject Code" + s_code_e + " has been updated successfully.');" +
                "window.location='../sishu_bikas_model_school/manage_subjects.aspx';" +
                "</script>");
            }
        }

        protected void delete_data()
        {
            s_code_e = subject_code_ddl.SelectedItem.Text;
            con.Close();
            error.Visible = false;
            cmd.CommandText = "DELETE FROM subjects " +
            "WHERE " +
            "subject_code='" + s_code_e + "'";
            con.Open();
            int r = cmd.ExecuteNonQuery();
            con.Close();
            if (r.Equals(1))
            {
                Response.Write("<script language='javascript'>" +
                "window.alert('Subject Code" + s_code_e + " has been deleted successfully.');" +
                "window.location='../sishu_bikas_model_school/manage_subjects.aspx';" +
                "</script>");
            }
        }
    }
}