<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/admin.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin_admin_teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="ny-right">
 <h3>教师管理</h3> <br></br>
<div class="ny-zjhz">
 
   
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" 
            EnableViewState="False" Font-Names="宋体" GridLines="None" Width="730px" 
            DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" 
            OnRowDeleting="GridView1_RowDeleting" PageSize="15">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>教师名</td><td>密码</td><td>图片</td><td>简介</td><td>编辑</td><td>删除</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("uname") %> </td><td><%# Eval("pwd") %> </td><td><img src="../admin/file/<%# Eval("pic") %>" width=100px; height=80px;/></td> <td><%# Eval("nr") %></td><td><asp:HyperLink ID="HyperLink1" Width="60px" Text='编辑' NavigateUrl='<%# "modify_product.aspx?id="+Eval("id") %>'
                                            runat="server"  /> </td>
                      </ItemTemplate>
                            <ItemStyle Width="10px" BorderStyle=None />
                  
                        </asp:TemplateField>
                        
                    <asp:CommandField ShowDeleteButton="True" >
                        <ItemStyle Width="10px" />
                    </asp:CommandField>
                     </Columns>
                    
                    </asp:GridView>



</div>

</div>

<div class="clear"></div>



</asp:Content>

