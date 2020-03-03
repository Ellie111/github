<%@ Page Title="" Language="C#" MasterPageFile="~/member.master" AutoEventWireup="true" CodeFile="member_pinglun.aspx.cs" Inherits="member_pinglun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>我的评论 </span>  
	
	 </h3>
	 <div class="scmb-ct">
<br>
<br>

<style>
    td{ padding:1px;border:1px solid #fff; padding:10px;}
     th{ width:1px;}
</style>
     <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="2" CellSpacing="1" 
            EnableViewState="False" Font-Names="宋体" GridLines="None" Width="660px" 
            DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" 
            OnRowDeleting="GridView1_RowDeleting" PageSize="15">
                   
                    <Columns>
                     
     <asp:TemplateField HeaderText="<td>课程名</td><td>评论人</td><td>评论内容</td><td>删除</td>" >
    
      <ItemTemplate>
                 
                  <td><%# Eval("title") %> </td> <td><%# Eval("uname") %></td>  <td><%# Eval("nr") %></td>
 

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

</asp:Content>

