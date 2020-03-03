<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="admin_dingdan.aspx.cs" Inherits="admin_admin_dingdan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="ny-right">
 <h3>订单管理</h3> <br></br>
<div class="ny-zjhz">
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
                     
     <asp:TemplateField HeaderText="<td>产品名</td><td>产品图片</td><td>价格</td><td>购买人</td><td>删除</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("title") %> </td><td><img src="../teacher/file/<%# Eval("pic") %>" width=80px; height=80px;/></td> <td><%# Eval("price") %></td>  <td><%# Eval("uname") %></td> 
               
                 

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

<div class="clear"></div>
</asp:Content>

