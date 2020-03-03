<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="member_dingdan.aspx.cs" Inherits="member_dingdan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>我的订单 </span>  
	
	 </h3>
	 <div class="scmb-ct">
<br>
<br>
<br>

<style>
    td{ padding:1px;border:1px solid #ddd;}
     th{ width:1px;}
</style>
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" 
            EnableViewState="False" Font-Names="宋体" GridLines="None" Width="660px" 
            DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" 
            OnRowDeleting="GridView1_RowDeleting" PageSize="15">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>标题</td><td>价格</td><td>产品图</td><td>购买人</td><td>评价</td><td>删除</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("title") %> </td> <td><%# Eval("price") %></td>  <td><img src="teacher/file/<%# Eval("pic") %>" width=80px; height=80px;/></td> <td><%# Eval("uname") %></td> <td><a href="member_ping.aspx?id=<%# Eval("id") %>">评价</a></td>  
               

                        </td>
                      </ItemTemplate>



      



                            <ItemStyle Width="100px" BorderStyle=None />
                  
                        </asp:TemplateField>
                        
                    <asp:CommandField ShowDeleteButton="True" >
                        <ItemStyle Width="100px" />
                    </asp:CommandField>
                     </Columns>
                    
                    </asp:GridView>
            
</div>

</div>

</asp:Content>

