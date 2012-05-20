<%@ page language="java" 
	import="pharmacy.Product"
	import="pharmacy.Item"
	import="java.util.List" 
	import="java.util.Date" 
	import="java.util.ArrayList"	
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<Product> catalog = (List<Product>) session.getAttribute("catalog");
	int productCategoryIndex = Integer.parseInt(request.getParameter("productCategoryIndex"));
	Product pc = catalog.get(productCategoryIndex);

/* 	try {
		if (request.getParameter("op").equals("edit")) {
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	String branch = request.getParameter("branch");
	double price = Double.parseDouble(request.getParameter("price"));
	int minStock = Integer.parseInt(request.getParameter("minStock"));
	int maxStock = Integer.parseInt(request.getParameter("maxStock"));

 			catalog.get(index).setName(name);
 			catalog.get(index).setDescription(description);
 			catalog.get(index).setBranch(branch);
 			catalog.get(index).setPrice(price);
 			catalog.get(index).setMinStock(minStock);
 			catalog.get(index).setMaxStock(maxStock);

	session.setAttribute("catalog", catalog);
		} else if (request.getParameter("op").equals("delete")) {
	int index = Integer.parseInt(request.getParameter("index"));
	catalog.remove(index);
	session.setAttribute("catalog", catalog);
		} else if (request.getParameter("op").equals("add")) {
	String name = request.getParameter("productCategoryName");

	double price = Double.parseDouble(request.getParameter("price"));

	//ToDo: check if the name and price are valid values.

	ProductCategory newProductCategory = new ProductCategory(name, price);

	catalog.add(newProductCategory);
	session.setAttribute("catalog", catalog);
		}

	} catch (Exception ex) {
		System.out.println("Error: " + ex);
	}
 */
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of Items</title>
</head>
<body>

	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="6">List of Items of the Product Category <%=pc.getName()%></TD>
		</TR>

		<TR>
			<TD>Item Id: </TD>
			<TD>Expiration Date: </TD>
			<TD>Location:</TD>
 			<TD>Edit Item</TD>
<!--  			<TD>Delete Item</TD> -->
		</TR>

		<%
			for (int i = 0; i < pc.getItemList().size(); i++) {
		%>
		<TR>
			<TD><%=pc.getItemList().get(i).getId()%></TD>
			<TD><%=pc.getItemList().get(i).getExpDate()%></TD>
			<TD><%=pc.getItemList().get(i).getLocation()%></TD>
			<TD><a href="../jsp/item.jsp?op=edit&productCategoryIndex=<%=productCategoryIndex%>&itemIndex=<%=i%>">Edit Item</a></TD>
<%-- 			<TD><a href="../jsp/listItem.jsp?op=delete&index=<%=i%>">X</a></TD> --%>
		</TR>
		<%
			}
		%>

	</TABLE>

		<p><a href="../jsp/item.jsp?op=new&productCategoryIndex=<%=productCategoryIndex%>">Add Items</a>
		<p><a href="../jsp/item.jsp?op=delete&productCategoryIndex=<%=productCategoryIndex%>">Remove Items</a>
		<p><a href="../jsp/listItem.jsp?op=list&productCategoryIndex=<%=productCategoryIndex%>">List Items</a>
		<p><a href="../jsp/listProductCategory.jsp?op=list">List Product Categories</a>
		<p>


</body>
</html>