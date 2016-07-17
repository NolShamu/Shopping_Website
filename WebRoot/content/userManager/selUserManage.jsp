<%@ page language="java" import="java.util.*,cn.dao.impl.UserDaoImpl,cn.bean.User,cn.dao.impl.RoleDaoImpl" pageEncoding="utf-8"%>
<%

RoleDaoImpl rul=new RoleDaoImpl();
UserDaoImpl udl=new UserDaoImpl();
List<User> list=udl.findAllUser();

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mainDisplay.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
  body{
    background-color:#d4f2ce;
    }
	.left{
		float:left;
		width:300px;
		height:100%;
		}
	div.right{
		width:800px;
		height:100%;
		float:right;
		border:#6CE7AC solid medium;
		}
		
		#menu ul{
		
			margin-top:0px;
			padding-left:0px;
			}
		#menu ul li{
			
			
			list-style:none;  
			line-height:50px;
			background-color:#4BBB85;
			margin-bottom:15px;
			
			} 
			ul#menu_small li{
		
			list-style:none;  
			line-height:30px;
			background-color:#B3F0D2;
			margin-bottom:10px;
		
			} 
			
			#menu ul li:hover{
				
				background-color:#5DE775;
				}
			
			#menu ul li a{
				text-align:center;
				text-decoration:none;
				color:#fff;
				font-weight:bold;
				letter-spacing:5PX;
				display:block;
				font-family:黑体;
				}
				      td {
      background-color:#d4f2ce;
      text-align:center;
      } 
</style>
 <script>
function display()
	{
		var flag=document.getElementById("menu_small").style.display;
		
		if(flag=="none")
		{
			document.getElementById("menu_small").style.display="block";
			}
		else{
			document.getElementById("menu_small").style.display="none";
			}
			
		}

</script>
  </head>
  
  <body>
     <div class="left">
    
     <div id="menu">
          <ul>
          <li> <marquee style="color:white;"><br/>欢迎来到管理员系统</marquee></li>
          <li><a href="content/userManager/selUserManage.jsp">用户管理</a></li>
          <li><a href="javascript:display()">商品管理</a></li>
          </ul>
          <ul id="menu_small" style="display:none;">
          <li><a href="content/goodsManage/addGoodsTypef.jsp">商品分类</a></li>
           <li><a href="library.html">商品添加</a></li>
            <li><a href="gym.html">商品查询</a></li>
          </ul>
          </div>
</div>
<div class="right">
<center>
<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
				<TR class="bg_header" height=47>
					<TD width=10><SPAN class="main_hl"></SPAN></TD>
					<TD><SPAN class="main_hl2"></SPAN> <SPAN class="main_hb">
					</SPAN> <SPAN class="main_hr"></SPAN></TD>
					<TD class="main_rc" width=10></TD>
				</TR>
				<TR>
					<TD class="main_ls">&nbsp;</TD>
					<TD class="main_nu" vAlign=top align=middle>
						<DIV>
						<center>
							<TABLE class=gridView
								style="WIDTH: 100%; BORDER-COLLAPSE: collapse" cellSpacing=0
								rules=all border=1>
								<TBODY>
                                   <tr>									
										<TH scope=col width=120 height=50>用户编号</TH>
										<TH scope=col width=120>用户名</TH>
										<TH scope=col width=120>性别</TH>
										<TH  scope=col width=120>地址</TH>
										<TH  scope=col width=120>角色类型</TH>
									</tr>
									
									
									<% 
									for(User user:list)
									{
									  String str=rul.selType(user.getRoleType());
									 %>
									<TR>
										<TD  height=30><%=user.getId() %></TD>
										<TD><%=user.getName() %></TD>
										<TD><%=user.getSex() %></TD>
										<TD><%=user.getAddress() %></TD>
										<TD><%=str %></TD>			
										</TD>
										
										
										
									</TR>
									<% } %>

							</TABLE>
						</DIV>
					</TD>
					<TD class="main_rs"></TD>
				</TR>
				<TR class="main_fs" height=10>
					<TD class="main_lf"></TD>
					<TD class="main_fs"></TD>
					<TD class="main_rf"></TD>
				</TR>
		</TABLE>
		</center>
</div>
  </body>
</html>
