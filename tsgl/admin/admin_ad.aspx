<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="admin_ad.aspx.cs" Inherits="admin_admin_ad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





<div class="ny-right">
  <h3>公告管理</h3>
    <br></br>
<div class="ny-zjhz">



     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" 
            EnableViewState="False" Font-Names="宋体" GridLines="None" Width="646px" 
            DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" 
            OnRowDeleting="GridView1_RowDeleting" PageSize="15">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>标题</td><td>发布人</td><td>简介</td><td>编辑</td><td>删除</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("title") %> </td> <td><%# Eval("uname") %></td>  <td><%# Eval("nr") %></td><td><asp:HyperLink ID="HyperLink1" Width="60px" Text='编辑' NavigateUrl='<%# "modify_news.aspx?id="+Eval("id") %>'
                                            runat="server"  /> </td>
                      </ItemTemplate>
                            <ItemStyle Width="10px" BorderStyle=None />
                  
                        </asp:TemplateField>
                        
                    <asp:CommandField ShowDeleteButton="True" >
                        <ItemStyle Width="100px" />
                    </asp:CommandField>
                     </Columns>
                    
                    </asp:GridView>
    


</div>

<div class="clear"></div>


</asp:Content>

