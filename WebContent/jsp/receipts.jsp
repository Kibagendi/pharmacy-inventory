<%@ page language="java" 
	import="pharmacy.Receipt"
	import="pharmacy.Request"
	import="pharmacy.Pharmacy" 
	import="java.util.Iterator"
	import="java.text.DecimalFormat"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//Singleton objects declaration
	Pharmacy pharmacy = Pharmacy.getInstance();

	DecimalFormat twoDec = new DecimalFormat("0.00");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Reception Management</title>
</head>
<body>

	<h2>Pharmacy Inventory System - <%=pharmacy.getName()%></h2>
	<p>

	<%
		if (request.getParameter("op").equals("list") ) {

	%>
	<h3>List of Receipts:</h3>
	<p>
	
	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="8" align="center"><h2> List of Receipts</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Number</b></TD>
			<TD align="center"><b>Product Name</b></TD>
			<TD align="center"><b>Laboratory</b></TD>
			<TD align="center"><b>Quantity Requested</b></TD>
			<TD align="center"><b>Quantity Received</b></TD>
			<TD align="center"><b>Unit Price</b></TD>
			<TD align="center"><b>Total Price</b></TD>
			<TD align="center"><b>Date</b></TD>
		</TR>

		<%
			Receipt receipt = null;
			int i=0;
			Iterator<Receipt> it = pharmacy.getReceiptIterator();

			while (it.hasNext()) {
				receipt = it.next();
				i++;
		%>
		<TR>
			<TD align="center"><b><%=i%></b></TD>
			<TD><%=receipt.getRequest().getPharmacyLine().getProduct().getBrandName()%></TD>
			<TD><%=receipt.getRequest().getPharmacyLine().getLaboratory().getName()%></TD>
			<TD align="center"><%=receipt.getRequest().getQuantity()%></TD>
			<TD align="center"><%=receipt.getQuantity()%></TD>
			<TD align="center"><%=twoDec.format(receipt.getUnitPrice())%></TD>
			<TD align="center"><%=twoDec.format(receipt.getUnitPrice()*receipt.getQuantity())%></TD>
			<TD align="center"><%=receipt.getReceptionDateString()%></TD>
		</TR>
		<%
			}
		%>

	</TABLE>
	<p>
	
	<p>
		<%
			// new option
			} else if (request.getParameter("op").equals("receive")) {

		%>
	<h3>Receiving Products from Laboratory:</h3>
	<p>
	
	<FORM method="post" action="../jsp/receipts.jsp?op=postReceive">

		<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="2" align="center"><h2>Product Reception</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Associated Request:</b></TD>
			<TD>
				<select name="requestCode" id="requestCode">
				<%
					Iterator <Request> it = pharmacy.getSentRequestIterator();
					Request req = null;
					String optionName = "";
					int optionCode;
					while (it.hasNext()) {
						req = it.next();
						optionName = req.getDescription();
						optionCode = req.hashCode();
				%>	
						<option value="<%=optionCode%>"><%=optionName%></option>
				<%
					}
				%>	
				</select> 

			</TD>
		</TR>
			<TR>
				<TD><b>Quantity:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=quantity SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Total Price:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=totalPrice SIZE=20></TD>
			</TR>
			<TR>
				<TD colspan="2" align="center"><INPUT type=reset value="Reset" /><INPUT
					type=submit value="Add" /></TD>
			</TR>

		</TABLE>
	</FORM>


			<%//postReceive
				} 
				else if (request.getParameter("op").equals("postReceive")) {
					Receipt receipt;
					int quantity = 0;
					int requestCode = 0;
					double totalPrice = 0;
					 boolean ok = false;
					if (!request.getParameter("requestCode").isEmpty())
					 	requestCode= Integer.parseInt(request.getParameter("requestCode"));
					if (!request.getParameter("quantity").isEmpty())
					 	quantity= Integer.parseInt(request.getParameter("quantity"));
					if (!request.getParameter("totalPrice").isEmpty()) 
						totalPrice= Double.valueOf(request.getParameter("totalPrice"));


					 try {

					   	 	//añadiendo el producto nuevo
						 	receipt = new Receipt(pharmacy.getRequest(requestCode),quantity,totalPrice);	
						 	ok = pharmacy.addReceiptItem(receipt);
						}
					 catch(Exception ex)
					 {
						 System.out.println("Error saving the new Receipt: " + ex);
						 ok = false;
					 }
					

			%>
		<p>
		<%if (ok) { %>
			<b>The Products was received successfully.</b> 
		<%}else { %>
			<b><font color="red">The Products could not be received.</font></b> 
		<%	
		 }
		%>

		<p>
	<%
	 }
	%>
	
	<BR>
	<BR>
	<BR>
	<BR>
	<TABLE align="center" BORDER=0>
	<TR><TD align="center"><a href="../jsp/receipts.jsp?op=list">List of Receipts</a></TD></TR>
	<TR><TD align="center"><a href="../jsp/receipts.jsp?op=receive">Receipts Management (Product Reception)</a></TD></TR>
	<TR><TD align="center"><a href="../index.jsp">Home</a></TD></TR>
	</TABLE>
</body>
</html>