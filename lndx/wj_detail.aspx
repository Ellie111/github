<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wj_detail.aspx.cs" Inherits="book_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="scmb2">
	   <h3> <span>内容详情</span>  
	
	 </h3>

     <div class="more">


    <asp:GridView ID="GridView1" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <dl>
                                         <dt> <img src="admin/file/<%# Eval("pic") %>" width=300px;height=auto; > </dt>
                                         <dd><h4>标题： <%# Eval("title") %> </h4>
                                              <span>发布人： <%# Eval("uname") %></span>  <br> 
                               
                                         
                                         
                                           </dd>
                                           </dl>
                                   
      <br><br>
                                      <br>
                                         
                                     <p><%# Eval("nr") %> </p>
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
  

</div>
</asp:Content>

