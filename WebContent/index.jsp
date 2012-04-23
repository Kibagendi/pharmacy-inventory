<%@ page language="java" import="pharmacy.ProductCategory"
	import="java.util.List" import="java.util.ArrayList"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.isNew()){
	List <ProductCategory> catalog = new ArrayList<ProductCategory>();
	session.setAttribute("catalog",catalog);
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy</title>
</head>
<body>
	<h2>Pharmacy</h2>
	This is the Pharmacy main page
	<BR>
	<p>
		<a href="jsp/productCategory.jsp?op=new">New Product Category</a>
	<p>
	<p>
		<a href="jsp/listProductCategory.jsp?op=list">List of Product
			Category</a>
	<p>

		<%-- Going to include product.jsp...<BR>
<jsp:include page="jsp/product.jsp"/>
 --%>
</body>
</html>