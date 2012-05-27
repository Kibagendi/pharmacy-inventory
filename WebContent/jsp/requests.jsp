<%@ page language="java" 
	import="pharmacy.Request"
	import="pharmacy.Pharmacy" 
	import="java.util.Iterator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Pharmacy pharmacy = Pharmacy.getInstance();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request List</title>
</head>
<body>

	<h2>
		Pharmacy Inventory System - <%=pharmacy.getName()%></h2>
	<p>
	<h3>Products Request List:</h3>
	<p>
	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="6" align="center"><h2>List of Requests</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Number</b></TD>
			<TD align="center"><b>Product Name</b></TD>
			<TD align="center"><b>Laboratory</b></TD>
			<TD align="center"><b>Quantity</b></TD>
			<TD align="center"><b>Date</b></TD>
			<TD align="center"><b>State</b></TD>
		</TR>

		<%
			Iterator<Request> it = pharmacy.getRequestIterator();
			Request req = null;
			int i=0;
			while (it.hasNext()) {
					req = it.next();
					i++;
		%>
		<TR>
			<TD align="center"><b><%=i%></b></TD>
			<TD><%=req.getPharmacyLine().getProduct().getBrandName()%></TD>
			<TD><%=req.getPharmacyLine().getLaboratory().getName()%></TD>
			<TD align="center"><%=req.getQuantity()%></TD>
			<TD><%=req.getRequestDateString()%></TD>
			<TD><%=req.getState()%></TD>
		</TR>
		<%
			}
		%>

	</TABLE>
	<p>
	<p>
		<a href="../index.jsp">Home</a>
	<p>
</body>
</html>