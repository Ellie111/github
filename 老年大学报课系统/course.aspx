<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="course.aspx.cs" Inherits="course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <div class="scmb">
	   <h3> <span>在线课程 </span>  
	
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
                                   <dl><dt><a href="book_detail.aspx?id=<%# Eval("id") %>"> <img src="teacher/file/<%# Eval("pic") %>" ></a></dt>
                                
                                     
                                       <dd><a href="book_detail.aspx?id=<%# Eval("id") %>"> <%# Eval("title") %></a> </dd>
                                        
                                   
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

</div>

</div>
</asp:Content>


