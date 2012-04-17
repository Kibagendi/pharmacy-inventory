<%@ page language="java" 
	import="pharmacy.ProductCategory" 
	import="java.util.List" 
	import="java.util.ArrayList"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 String name =  request.getParameter("productCategoryName");
 String priceTmp  = request.getParameter("price");
 //String quantityTmp = request.getParameter("quantity");
 
 double price = Double.parseDouble(priceTmp);  
 //int quantity = Integer.parseInt(quantityTmp);

 ProductCategory newProductCategory = new ProductCategory(name, price);
//  session.setAttribute("newProductCategory",newProductCategory);

 List <ProductCategory> catalog = (List <ProductCategory>) session.getAttribute("catalog");
 catalog.add(newProductCategory);
 session.setAttribute("catalog",catalog);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <title>New Product Category</title> -->
</head>
<body>

<TABLE align="center">
<TR><TD> New Product Category</TD></TR> 

<TR>
  <TD> Product Category: 
      <% out.println(newProductCategory.getName()); %> </TD></TR>

<TR>
  <TD> Current Stock : 
      <% out.println(newProductCategory.getCurrentStock()); %> </TD>
</TR>

<TR>
  <TD> Price :  
      <% out.println(newProductCategory.getPrice()); %> 
  </TD>
</TR>
</TABLE>
<p><a href="../jsp/listProductCategory.jsp?op=list">List Product Category</a><p>
<p><a href="../index.jsp">Home</a><p>
</body>
</html>