<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="member_account.aspx.cs" Inherits="member_account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>我的账户 </span>  
	
	 </h3>
	 <div class="scmb-ct">
<br>
<br>
<br>
    
    <h4 style=" text-align:center; font-size:16px;">我的账户</h4>
     <br><br>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" EnableViewState="False" Font-Names="宋体" GridLines="None" Width="500px" DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging"  PageSize="5">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>账户</td><td>姓名</td><td>余额</td><td>充值</td> " >
    
      <ItemTemplate>
                 
               <td><%# Eval("id") %></td>   <td><%# Eval("uname") %> </td><td><%# Eval("account") %> </td> <td><asp:HyperLink ID="HyperLink1" Width="60px" Text='充值' NavigateUrl='<%# "modify_account.aspx?id="+Eval("id") %>'
                                            runat="server"  /> </td>
                      </ItemTemplate>
                            <ItemStyle Width="100px" BorderStyle=None />
                  
                        </asp:TemplateField>
                        
                  
                     </Columns>
  
                    </asp:GridView>
             


</div>

</div>

</asp:Content>

