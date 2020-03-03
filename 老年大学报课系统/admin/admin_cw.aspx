<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="admin_cw.aspx.cs" Inherits="admin_admin_dingdan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="ny-right">
 <h3>财务管理</h3> <br></br>
<div class="ny-zjhz">
<br>


<h4 style="text-align:center;">会员账户情况</h4>

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
                     
     <asp:TemplateField HeaderText="<td>用户名</td><td>身份</td><td>账户余额</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("uname") %> </td><td><%# Eval("role") %></td>  <td><%# Eval("account") %></td> 
               
                 

                        </td>
                      </ItemTemplate>



      



                            <ItemStyle Width="100px" BorderStyle=None />
                  
                        </asp:TemplateField>
                        
                   
                     </Columns>
                    
                    </asp:GridView>
    <br>

    <h4 style="text-align:center;">本年度课程销售总额：<asp:Label ID="zjl" runat="server" Text="Label"></asp:Label> 元</h4>
                                </div>

</div>

<div class="clear"></div>
</asp:Content>

