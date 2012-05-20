<%@ page language="java" 
	import="pharmacy.Product"
	import="pharmacy.Pharmacy" 
	import="pharmacy.ProductCatalog"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductCatalog productCatalog = (ProductCatalog) session.getAttribute("productCatalog");
	Pharmacy farmacia = (Pharmacy) session.getAttribute("pharmacy");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of products categories</title>
</head>
<body>
	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="6">List of Product Category</TD>
		</TR>

		<TR>
			<TD>Product Category Name</TD>
			<TD>Product Category Description</TD>
			<TD>Product Category Price</TD>
			<TD>Current Stock</TD>
			<TD>Edit Category</TD>
			<TD>Delete Category</TD>
		</TR>

		<%
			for (int i = 0; i < catalog.size(); i++) {
		%>
		<TR>
			<TD><%=catalog.get(i).getName()%></TD>
			<TD><%=catalog.get(i).getDescription()%></TD>
			<TD><%=catalog.get(i).getPrice()%></TD>
			<TD><%=catalog.get(i).getCurrentStock()%></TD>
			<TD><a
				href="../jsp/productCategory.jsp?op=edit&productCategoryIndex=<%=i%>">Edit
					Category</a></TD>
			<TD><a
				href="../jsp/listProductCategory.jsp?op=delete&index=<%=i%>">X</a></TD>
		</TR>
		<%
			}
		%>

	</TABLE>
	<p>
		Number of categories
		<%out.println(catalog.size());%>
	
	<p>
	<p>
		<a href="../jsp/productCategory.jsp?op=new">New Product Category</a>
	<p>
	<p>
		<a href="../index.jsp">Home</a>
	<p>
</body>
</html>