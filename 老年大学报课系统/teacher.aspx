<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="teacher.aspx.cs" Inherits="course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <div class="scmb">
	   <h3> <span>师资队伍 </span>  
	
	 </h3>
	 <div class="scmb-ct">

         <style>
             tr { display:block;float:left;
             }


         </style>

     
					 <asp:GridView ID="GridView1" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                   <dl><dt><a href="nr_detail.aspx?id=<%# Eval("id") %>"> <img src="admin/file/<%# Eval("pic") %>" ></a></dt>
                                
                                     
                                       <dd><a href="nr_detail.aspx?id=<%# Eval("id") %>"> <%# Eval("uname") %></a> </dd>
                                        
                                   
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

</div>

</div>
</asp:Content>


