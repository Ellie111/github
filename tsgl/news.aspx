<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>新闻公告</span>  
	
	 </h3>
	 <div class="scmb-ct">

<ul>
  <asp:GridView ID="GridView1" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                             
                                
                                     
                                       <li><asp:HyperLink ID="HyperLink1" Text='<%# Eval("title") %>' NavigateUrl='<%# "shownews.aspx?id="+Eval("id") %>'
                                            runat="server" /> </li>
                                        
                                   
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
 


</ul>

   </div> 
  	</div>   

</asp:Content>

