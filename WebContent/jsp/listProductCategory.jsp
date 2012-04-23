<%@ page language="java" 
	import="pharmacy.ProductCategory"
	import="java.util.List" 
	import="java.util.ArrayList"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<ProductCategory> catalog = (List<ProductCategory>) session
			.getAttribute("catalog");
	try {
		if (request.getParameter("op").equals("edit")) {
			int index = Integer.parseInt(request.getParameter("index"));
			System.out.println("index" + index);
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

			double price = Double.parseDouble(request
					.getParameter("price"));

			//ToDo: check if the name and price are valid values.

			ProductCategory newProductCategory = new ProductCategory(
					name, price);

			catalog.add(newProductCategory);
			session.setAttribute("catalog", catalog);
		}

	} catch (Exception ex) {
		System.out.println("Error: " + ex);

	}
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
		<%
		out.println(catalog.size());
	%>
	
	<p>
	<p>
		<a href="../jsp/productCategory.jsp?op=new">New Product Category</a>
	<p>
	<p>
		<a href="../index.jsp">Home</a>
	<p>
</body>
</html>