<%@ Page Title="" Language="C#" MasterPageFile="admin.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="ny-right">
  <h3>用户管理</h3>
    <br> <br> <br>
<div class="ny-zjhz">




    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" EnableViewState="False" Font-Names="宋体" GridLines="None" Width="500px" DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" PageSize="5">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>姓名</td><td>密码</td><td>邮件</td><td>删除</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("uname") %> </td> <td><%# Eval("pwd") %></td>   <td><%# Eval("email") %></td>
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

<div class="clear"></div>



</asp:Content>

