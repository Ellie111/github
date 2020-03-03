<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>搜索结果</span>  
	
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
                                   <dl><dt> <img src="admin/file/<%# Eval("pic") %>" ></dt>
                                
                                     
                                       <dd><p><asp:HyperLink ID="HyperLink1" Text='<%# Eval("title") %>' NavigateUrl='<%# "showproduct.aspx?id="+Eval("id") %>'
                                            runat="server" /></p> </dd>
                                        
                                   
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

 </div>
 
</div>
</asp:Content>

