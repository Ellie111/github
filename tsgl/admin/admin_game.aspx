<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="admin_game.aspx.cs" Inherits="admin_admin_news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





<div class="ny-right">
  <h3>赛事管理管理</h3>
    <br></br>
<div class="ny-zjhz">



     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" 
            EnableViewState="False" Font-Names="宋体" GridLines="None" Width="646px" 
            DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" 
            OnRowDeleting="GridView1_RowDeleting" PageSize="15">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>赛事名称</td><td>发布人</td><td>赛事简介</td><td>编辑</td><td>删除</td>" >
    
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
    
    <div class="fbxw">
         <h4>添加赛事</h4>
        <br>
        赛事名称：<asp:TextBox ID="bt" runat="server"></asp:TextBox>  <br/> <br/>
        发布人：<asp:TextBox ID="lxr" runat="server"></asp:TextBox><br/> <br/>
  
        赛事简介: <asp:TextBox ID="content" runat="server" Height="162px" 
            Width="271px" TextMode="MultiLine"></asp:TextBox><br/> <br/>
     <asp:Button ID="btn_ok" runat="server" Text="发布" OnClick="btn_click"/>
        </div>

</div>

</div>

<div class="clear"></div>


</asp:Content>

