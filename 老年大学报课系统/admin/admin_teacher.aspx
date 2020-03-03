<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="admin_teacher.aspx.cs" Inherits="admin_admin_teacher" %>

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
                 
                  <td><%# Eval("uname") %> </td><td><%# Eval("pwd") %> </td><td><img src="file/<%# Eval("pic") %>" width=100px; height=80px;/></td> <td><%# Eval("nr") %></td><td><asp:HyperLink ID="HyperLink1" Width="60px" Text='编辑' NavigateUrl='<%# "modify_product.aspx?id="+Eval("id") %>'
                                            runat="server"  /> </td>
                      </ItemTemplate>
                            <ItemStyle Width="10px" BorderStyle=None />
                  
                        </asp:TemplateField>
                        
                    <asp:CommandField ShowDeleteButton="True" >
                        <ItemStyle Width="10px" />
                    </asp:CommandField>
                     </Columns>
                    
                    </asp:GridView>


        <div class="fbxw">
         教师名：<asp:TextBox ID="bookname" runat="server"></asp:TextBox>  <br/> <br/>
        密码：<asp:TextBox ID="price" runat="server"></asp:TextBox><br/> <br/>
        邮箱：<asp:TextBox ID="email" runat="server"></asp:TextBox><br/> <br/>

       图片： <asp:FileUpload ID="fuUpLoad" runat="server" /><br>  <br/>
        简介：<asp:TextBox ID="content" runat="server" Height="162px" 
            Width="271px" TextMode="MultiLine"></asp:TextBox><br/> <br/>
     <asp:Button ID="btn_ok" runat="server" Text="发布" OnClick="btn_click"/>
            </div>

</div>

</div>

<div class="clear"></div>



</asp:Content>

