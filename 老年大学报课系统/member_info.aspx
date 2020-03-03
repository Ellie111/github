<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="member_info.aspx.cs" Inherits="member_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>个人账户 </span>  
	
	 </h3>
	 <div class="scmb-ct">
<br>
<br>
<br>
    
    <h4 style=" text-align:center; font-size:16px;">个人账户信息</h4>
     <br><br>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" EnableViewState="False" Font-Names="宋体" GridLines="None" Width="500px" DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging"  PageSize="5">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>姓名</td><td>密码</td><td>邮件</td><td>修改</td> " >
    
      <ItemTemplate>
                 
                  <td><%# Eval("uname") %> </td> <td><%# Eval("pwd") %></td>   <td><%# Eval("email") %></td><td><asp:HyperLink ID="HyperLink1" Width="60px" Text='修改' NavigateUrl='<%# "modify_member.aspx?id="+Eval("id") %>'
                                            runat="server"  /> </td>
                      </ItemTemplate>
                            <ItemStyle Width="100px" BorderStyle=None />
                  
                        </asp:TemplateField>
                        
                  
                     </Columns>
  
                    </asp:GridView>
             


</div>

</div>

</asp:Content>

