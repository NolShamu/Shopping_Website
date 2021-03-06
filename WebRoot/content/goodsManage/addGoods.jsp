<%@ page language="java" import="java.util.*,cn.dao.impl.GoodsTypeDaoImpl,cn.bean.GoodsType" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

GoodsTypeDaoImpl typedao=new GoodsTypeDaoImpl();
List<GoodsType> types=typedao.selAllGoodsType();
session.setAttribute("types",types);

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
				input.dec{
                   width:100px;
                   height:30px;
                   margin-left:20px;
                   background-color:#8AD973;
                         }
                td{
				width:80px;
				height:50px;
				}
				table{
					border:#6CE7AC solid medium;
				}
</style>
 <script>
 function check(){
    var productName = document.getElementById("productName").value;
    var productPrice = document.getElementById("productPrice").value;
    var productNumber = document.getElementById("productNumber").value;
    var description = document.getElementById("description").value;
    
    
      if(productName ==  null || productName == ''){
        alert("商品名字不能为空");
        return false;
   }
      if(productPrice ==  null || productPrice == ''){
        alert("商品价格不能为空");
        return false;
   }
    if(productNumber ==  null || productNumber == ''){
        alert("商品数量不能为空");
        return false;
   }
    if(description ==  null || description == ''){
        alert("商品描述不能为空");
        return false;
   }
   return true;
}

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
           <li><a href="content/goodsManage/addGoods.jsp">商品添加</a></li>
            <li><a href="content/goodsManage/searchGoods.jsp">商品查询</a></li>
          </ul>
          </div>
</div>
<div class="right">
  <center style="padding-top:50px">
   <form action="<%=path %>/addGoods" method="post" onsubmit="return check()">
      <table>
      <tr>
       <th>添加商品</th>
      </tr>
        <tr>
        <td>商品名称：</td>
        <td colspan="3"><input type="text" name="ProductName" id="productName"></td>
        </tr>
        <tr>
        <td>商品价格：</td>
        <td><input name="productPrice" id="productPrice"></td>
         <td>商品数量：</td>
        <td><input type="text" name="productNumber" id="productNumber"></td>
        </tr>
         <tr>
        <td>商品详情：</td>
        <td><input name="description" id="description"></td>
         <td>商品类型：</td>
        <td>
           <select name="goodsType" style="WIDTH:45% ;color:#566984">
			 <option value="-1">请选择</option>	
			 <c:forEach items='${types }' var="type">
			   <option value="${type.id}"> ${type.typeName} </option>	
			 </c:forEach>		
			</select>
		</td>
        </tr>
         <tr>
         <td colspan="4">
           <center>
           <input type="submit" value="提交 " class="dec"/>
           <input type="reset" value="重置"  class="dec"/>
           </center>
         </td>
      </tr>
      </table>
    </form>
  </center>
 </div>
 </body>
 </html>
