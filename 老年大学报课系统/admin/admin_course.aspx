<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="admin_course.aspx.cs" Inherits="admin_admin_course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="ny-right">
 <h3>课程管理</h3> <br></br>
<div class="ny-zjhz">
 
   
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" 
            EnableViewState="False" Font-Names="宋体" GridLines="None" Width="730px" 
            DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" 
            OnRowDeleting="GridView1_RowDeleting" PageSize="15">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>课程名</td><td>授课教师</td><td>课程图片</td><td>试看视频</td><td>完整视频</td><td>课程简介</td><td>编辑</td><td>删除</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("title") %> </td><td><%# Eval("teacher") %> </td><td><img src="../teacher/file/<%# Eval("pic") %>" width=100px; height=80px;/></td><td><a href="file/<%# Eval("mvideo") %>"><%# Eval("mvideo") %></a></td><td><a href="file/<%# Eval("video") %>"><%# Eval("video") %></a></td> <td><%# Eval("nr") %></td><td><asp:HyperLink ID="HyperLink1" Width="60px" Text='编辑' NavigateUrl='#'
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

