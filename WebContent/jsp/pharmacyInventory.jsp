<%@ page language="java" 
	import="pharmacy.Product"
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
		if (request.getParameter("op").equals("list") ||  request.getParameter("op").equals("delete")) {

			PharmacyLine pharmacyLine = null;			
	
			if(request.getParameter("op").equals("delete"))
			{
				int pharmacyLineCode = Integer.parseInt(request.getParameter("pharmacyLineCode"));
				pharmacyLine = pharmacy.getPharmacyLine(pharmacyLineCode);
				pharmacy.removeItem(pharmacyLine);
			 	session.setAttribute("pharmacy", pharmacy);
			}

			Iterator<PharmacyLine> it = pharmacy.getIterator();

	%>
	<h3>Pharmacy Inventory:</h3>
	<p>
	
	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="10" align="center"><h2>Pharmacy lines</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Product</b></TD>
			<TD align="center"><b>Laboratory</b></TD>
			<TD align="center"><b>Buy Price</b></TD>
			<TD align="center"><b>Current Stock</b></TD>
			<TD align="center"><b>Min Stock</b></TD>
			<TD align="center"><b>Max Stock</b></TD>
			<TD align="center"><b>Location</b></TD>
			<TD align="center"><b>Sell Product</b></TD>
			<TD align="center"><b>Edit Line</b></TD>
			<TD align="center"><b>Delete Line</b></TD>
		</TR>

		<%
			while (it.hasNext()) {
				pharmacyLine = it.next();
		%>
		<TR>
			<TD><%=pharmacyLine.getProduct().getBrandName()%></TD>
			<TD><%=pharmacyLine.getLaboratory().getName()%></TD>
			<TD><%=pharmacyLine.getBuyPrice().getPrice()%></TD>
			<TD><%=pharmacyLine.getCurrentStock()%></TD>
			<TD><%=pharmacyLine.getMinStock()%></TD>
			<TD><%=pharmacyLine.getMinStock()%></TD>
			<TD><%=pharmacyLine.getLocation()%></TD>
			<TD align="center"><a href="../jsp/pharmacyInventory.jsp?op=sell&pharmacyLineCode=<%=pharmacyLine.hashCode()%>">Sell</a></TD>
			<TD align="center"><a href="../jsp/pharmacyInventory.jsp?op=edit&pharmacyLineCode=<%=pharmacyLine.hashCode()%>">Edit</a></TD>
			<TD align="center"><a href="../jsp/pharmacyInventory.jsp?op=delete&pharmacyLineCode=<%=pharmacyLine.hashCode()%>">X</a></TD>
		</TR>
		<%
			}
		%>

	</TABLE>
	<p>
		Number of Lines:
		<%
		out.println(productCatalog.Size());
	%>
	
	
	
			<%
			// new option
			} else if (request.getParameter("op").equals("new")) {
				
				PharmacyLine pharmacyLine = null;
				Laboratory laboratory = null;
				Iterator <PharmacyLine> it_pl = null;
				Iterator <Laboratory> it_l = null;
				String option = new String();

		%>
	<h3>Adding a new Pharmacy Line in the Inventory:</h3>
	<p>
	
	<FORM method="post" action="../jsp/pharmacyInventory.jsp?op=postNew">

		<TABLE align="center" BORDER=2>

			<TR>
				<TD><b>Product:</b></TD>
				<TD>
				<select name="product" id="product">
				<%
				it_pl = pharmacy.getIterator();
				while (it_pl.hasNext()) {
					pharmacyLine = it_pl.next();
					option = pharmacyLine.getProduct().getBrandName();
				%>	
						<option value="<%=option%>"><%=option%></option>
				<%
				}				
				%>	
				</select> 
				</TD>
			</TR>
			<TR>
				<TD><b>Laboratory:</b></TD>
				<TD>
				<select name="laboratory" id="laboratory">
				<%
				it_l = laboratoryList.getIterator();
				while (it_l.hasNext()) {
					laboratory = it_l.next();
					option = laboratory.getName();
				%>	
						<option value="<%=option%>"><%=option%></option>
				<%
				}				
				%>	
				</select> 
				</TD>

			</TR>
			<TR>
				<TD><b>Buy Price:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=buyPrice SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Current Stock:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=currentStock SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Min Stock:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=minStock SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Max Stock:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=maxStock SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Location:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=location SIZE=20></TD>
			</TR>

			<TR>
				<TD colspan="2" align="center"><INPUT type=reset value="Reset" /><INPUT
					type=submit value="Add" /></TD>
			</TR>

		</TABLE>
	</FORM>


			<%//postNew
				} 
				else if (request.getParameter("op").equals("postNew")) {
					Product product;
					
					 String brandName= request.getParameter("brandName");
					 String primaryIngredient= request.getParameter("primaryIngredient");
					 String strength= request.getParameter("strength");
					 String sizeOrCount= request.getParameter("sizeOrCount");
					 String doseForm= request.getParameter("doseForm");
					 String administrationRoute= request.getParameter("administrationRoute");

					 try {

					   	 	//añadiendo el producto nuevo
						 	product = new Product(brandName, primaryIngredient, strength, sizeOrCount, doseForm, administrationRoute);	
						 	productCatalog.addItem(product);
						 	session.setAttribute("productCatalog", productCatalog);
						}
					 catch(Exception ex)
					 {
						 System.out.println("Error saving the new product: " + ex);
					 }
					

			%>
		<p>
			<b>The Line was create succesfully.</b> 
		<p>
	
	
	
	
	<%	
		}
	%>
	
	<p>
	<p><a href="../jsp/pharmacyInventory.jsp?op=list">Pharmacy Inventory</a>
	<p><a href="../jsp/pharmacyInventory.jsp?op=new">Add a new Pharmacy Line</a>
	<p><a href="../index.jsp">Home</a>
	<p>
</body>
</html>