﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="shownews.aspx.cs" Inherits="shownews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="scmb">
	   <h3> <span>内容详情 </span>  
	
	 </h3>
	 <div class="scmb-ct">
 
         <DIV style="padding:0 0 0 30px;">

    <asp:GridView ID="GridView1" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <h4 style=" text-align:center; width:600px; display:block;"> <%# Eval("title") %> </h4> <br>
                                       <p>发布人： <%# Eval("uname") %></p> <br>
                                                               
                                     <p><%# Eval("nr") %> </p><br><br><br><br>
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
 </DIV>

</div>
</div>
</asp:Content>

