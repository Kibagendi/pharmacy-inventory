<%@ page language="java" 
	import="pharmacy.Product"
	import="pharmacy.BillLine"
	import="pharmacy.Bill"
	import="pharmacy.Price"
	import="pharmacy.Pharmacy"
	import="pharmacy.PharmacyLine"
	import="pharmacy.LaboratoryList"
	import="pharmacy.Laboratory"
	import="pharmacy.ProductCatalog"
	import="java.util.Iterator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductCatalog productCatalog = (ProductCatalog) session.getAttribute("productCatalog");
	Pharmacy pharmacy = (Pharmacy) session.getAttribute("pharmacy");
	LaboratoryList laboratoryList = (LaboratoryList) session.getAttribute("laboratoryList");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy Inventory</title>
</head>
<body>
	<h2>Pharmacy Inventory System - <%=pharmacy.getName()%></h2>
	<p>

	<%
		if (request.getParameter("op").equals("start")) {

			PharmacyLine pharmacyLine = null;
			Iterator<PharmacyLine> it = pharmacy.getIterator();
			String optionName = new String();
			int optionCode;
			int billId = pharmacy.numberOfBills() + 1;
			Bill bill = new Bill("Client 1", billId);
			pharmacy.addBillItem(bill);
			session.setAttribute("pharmacy", pharmacy);
	%>
	<h3>Sell Products:</h3>
	<p>
	
	<FORM method="post" action="../jsp/seller.jsp?op=add">

	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="2" align="center"><h2>Pharmacy lines</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Pharmacy Line</b></TD>
			<TD align="center"><b>Quantity</b></TD>
		</TR>

		<TR>
			<TD>
				<select name="pharmacyLineCode" id="pharmacyLineCode">
				<%
					it = pharmacy.getIterator();
						while (it.hasNext()) {
							pharmacyLine = it.next();
							optionName = pharmacyLine.getDescription();
							optionCode = pharmacyLine.hashCode();
				%>	
						<option value="<%=optionCode%>"><%=optionName%></option>
				<%
					}
				%>	
				</select> 

			</TD>
			<TD><input type="text" name="quantity" /></TD>
		</TR>

		<TR>
			<TD colspan="2" align="center">
				<INPUT type=reset value="Reset" />
				<INPUT type="hidden" name="billId" value="<%=billId%>" />
				<INPUT type=submit value="Add to shopping car" /></TD>
			</TR>

	</TABLE>
	</FORM>
	
	<p>
	
	<p>

	<%
		} else if (request.getParameter("op").equals("add")) {

			int billId = Integer.parseInt(request.getParameter("billId"));
			int pharmacyLineCode = Integer.parseInt(request.getParameter("pharmacyLineCode"));
			int quantity = Integer.parseInt(request
					.getParameter("quantity"));
			double totalPrice;
			boolean ok = false;

			Bill bill = pharmacy.getBill(billId-1);

			PharmacyLine pharmacyLine = pharmacy.getPharmacyLine(pharmacyLineCode);

			if (pharmacyLine.sellPharmacyLine(quantity)) {
				
				totalPrice = quantity * pharmacyLine.getPrice().getSellPrice();

				BillLine billLine = new BillLine(pharmacyLine, quantity, totalPrice);

				bill.addItem(billLine);
				ok = true;
			}

			Iterator<PharmacyLine> it = pharmacy.getIterator();
			String optionName = new String();
			int optionCode;
	%>
	<h3>Selling Products:</h3>
	<p>
		<%if (ok) { %>
			<b>The product was add to the bill.</b> 
		<%}else { %>
			<b><font color="red">The product could not be added to the Bill.</font></b> 
		<%	
		 }
		%>
	
		<p>

	<FORM method="post" action="../jsp/seller.jsp?op=continue">

	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="5" align="center"><h2>Bill</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Product</b></TD>
			<TD align="center"><b>Laboratory</b></TD>
			<TD align="center"><b>Quantity</b></TD>
			<TD align="center"><b>Unit Price</b></TD>
			<TD align="center"><b>Total Price</b></TD>
		</TR>
		<%
			Iterator <BillLine> it_b = bill.getIterator();
			BillLine billLine;
			//PharmacyLine parmacyLine;
			while (it_b.hasNext()) {
				billLine = it_b.next();
				pharmacyLine = billLine.getPharmacyLine();
		%>
		<TR>
			<TD><%=pharmacyLine.getProduct().getBrandName()%></TD>
			<TD><%=pharmacyLine.getLaboratory().getName()%></TD>
			<TD><%=pharmacyLine.getPrice().getSellPrice()%></TD>
			<TD><%=billLine.getQuantity()%></TD>
			<TD><%=billLine.getTotalPrice()%></TD>
		</TR>

				<%
					}
				%>	

		<TR>
			<TD colspan="5" align="center">
				<INPUT type=submit value="continue shopping" /></TD>
			</TR>

	</TABLE>

	</FORM>




	<%
		}
	%>
	
	<p>
<!-- 	<p><a href="../jsp/seller.jsp?op=continue">Continue shopping</a> -->
	<p><a href="../jsp/seller.jsp?op=finish">Finish shopping</a>
		<p><a href="../jsp/seller.jsp?op=cancel">Cancel shopping</a>
	<p><a href="../index.jsp">Home</a>
	<p>
</body>
</html>