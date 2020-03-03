<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="book_detail.aspx.cs" Inherits="book_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="scmb2">
	   <h3> <span>内容详情</span>  
	
	 </h3>

     <div class="more">

                       <div id="sk"  visible="true" runat ="server">
    <asp:GridView ID="GridView1" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <dl>
                                         <dt> <img src="teacher/file/<%# Eval("pic") %>" width=300px;height=auto; > </dt>
                                         <dd><h4>标题： <%# Eval("title") %> </h4>
                                              <span>价格： <%# Eval("price") %></span>  <br> 
                                              <span>教师： <%# Eval("teacher") %></span> <br>
                                              <span>简介： <%# Eval("nr") %></span> <br>
                                              <span>说明： 试看部分，全部看请购买</span>   <br>
                                          
                                         
                                           </dd>
                                        
                                       
                                       </dl>

                                               试看部分：
                                            <video width="320" height="240" controls="controls">
<source src="teacher/file/<%# Eval("mvideo") %>" type="video/mp4" />
<source src="movie.ogg" type="video/ogg" />
<source src="movie.webm" type="video/webm" />
<object data="teacher/file/<%# Eval("mvideo") %>" width="320" height="240">
<embed src="teacher/file/<%# Eval("mvideo") %>" width="320" height="240" />
</object>
</video> 
                                        <br>
                                   
                                         
                      
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>




                                  

                                      
                         <div style="display:none;">

                               <asp:TextBox ID="title" runat="server"></asp:TextBox>
            
                                        <asp:TextBox ID="tid" runat="server"></asp:TextBox>
 
                                  <asp:TextBox ID="account" runat="server"></asp:TextBox>
                                              <asp:TextBox ID="price" runat="server"></asp:TextBox>
                          
                                            <asp:TextBox ID="pic" runat="server"></asp:TextBox>
                                              <asp:TextBox ID="uname" runat="server"></asp:TextBox>
                            </div>
                                      <span id="buy">    <asp:Button ID="gp" runat="server" OnClick="btn_gp" Text="购买课程" /> </span>
 


                                         </div>


                                     <div id="wz" visible="false" runat="server">
                                                    

                                             <div id="Div1"  visible="true" runat ="server">
    <asp:GridView ID="GridView2" runat="server" 
              AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" EnableViewState="False"  GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" >
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                       <dl>
                                         <dt> <img src="teacher/file/<%# Eval("pic") %>" width=300px;height=auto; > </dt>
                                         <dd><h4>标题： <%# Eval("title") %> </h4>
                                              <span>价格： <%# Eval("price") %></span>  <br> 
                                              <span>教师： <%# Eval("teacher") %></span> <br>
                                              <span>说明： 试看部分，全部看请购买</span>   <br>
                                          
                                         
                                           </dd>
                                        
                                       
                                       </dl>

                                          完整部分：
                                            <video width="320" height="240" controls="controls">
<source src="teacher/file/<%# Eval("video") %>" type="video/mp4" />
<source src="movie.ogg" type="video/ogg" />
<source src="movie.webm" type="video/webm" />
<object data="teacher/file/<%# Eval("video") %>" width="320" height="240">
<embed src="teacher/file/<%# Eval("video") %>" width="320" height="240" />
</object>
</video> 
                                        <br>
                                   
                                         
                      
                             
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>



                                         </div>
       

        </div>

         
                                     
                                         



        
</asp:Content>

