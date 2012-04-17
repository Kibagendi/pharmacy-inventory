<%@ page language="java" 
	import="pharmacy.ProductCategory" 
	import="java.util.List" 
	import="java.util.ArrayList"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 int index = Integer.parseInt(request.getParameter("productCategoryIndex"));
 List <ProductCategory> catalog = (List <ProductCategory>) session.getAttribute("catalog");
 ProductCategory pc = catalog.get(index);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modifying Product Category Information</title>
</head>
<body>
<FORM method="post" action="../jsp/listProductCategory.jsp?op=edit">

<TABLE align="center" BORDER=2>
<TR><TD  colspan="2"> Modifying Product Category Information</TD></TR> 

<TR> <TD> Product Category Name </TD><TD><INPUT TYPE=TEXT NAME=name SIZE=20 VALUE="<%= pc.getName() %>"></TD></TR>
<TR> <TD> Current Stock </TD><TD><%= pc.getCurrentStock() %></TD></TR>
<TR> <TD> Description </TD><TD><INPUT TYPE=TEXT NAME=description SIZE=20 VALUE="<%= pc.getDescription() %>"></TD></TR>
<TR> <TD> Branch </TD><TD><INPUT TYPE=TEXT NAME=branch SIZE=20 VALUE="<%= pc.getBranch() %>"></TD></TR>
<TR> <TD> Price </TD><TD><INPUT TYPE=TEXT NAME=price SIZE=20 VALUE="<%= pc.getPrice() %>"></TD></TR>
<TR> <TD> Min Stock </TD><TD><INPUT TYPE=TEXT NAME=minStock SIZE=20 VALUE="<%= pc.getMinStock() %>"></TD></TR>
<TR> <TD> Max Stock </TD><TD><INPUT TYPE=TEXT NAME=maxStock SIZE=20 VALUE="<%= pc.getMaxStock() %>"></TD></TR>
<TR> <TD> Add Item to the Product category</TD><TD><a href="../jsp/newItem.jsp?productCategoryIndex=<%= index %>">Add Item</a></TD>
<TR> <TD> Remove Item from the Product category</TD><TD><a href="../jsp/removeItem.jsp?productCategoryIndex=<%= index %>">Remove Item</a></TD>

<TR> <TD colspan="2"><INPUT TYPE=text NAME=index VALUE="<%= index %>"></TD></TR>
<TR> <TD colspan="2" align="center"> <INPUT type=reset value="Reset"/><INPUT type=submit value="Modify"/></TD></TR>

</TABLE>
<p><a href="../jsp/listProductCategory.jsp?op=list">List Product Category</a><p>
<p><a href="../index.jsp">Home</a><p>
</body>
</html>