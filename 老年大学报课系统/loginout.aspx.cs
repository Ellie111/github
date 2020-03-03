using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loginout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        Session.Remove("yhm");
        Session.Remove("account");
        Session.Remove("tid");


        this.Response.Redirect("default.aspx");  
    }
}