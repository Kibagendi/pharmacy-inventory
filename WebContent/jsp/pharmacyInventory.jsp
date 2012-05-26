<%@ page language="java" 
	import="pharmacy.Product"
	import="pharmacy.Price"
	import="pharmacy.Pharmacy"
	import="pharmacy.PharmacyLine"
	import="pharmacy.LaboratoryList"
	import="pharmacy.Laboratory"
	import="pharmacy.ProductCatalog"
	import="java.util.Iterator"
	import="java.text.DecimalFormat"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductCatalog productCatalog = (ProductCatalog) session.getAttribute("productCatalog");
	Pharmacy pharmacy = (Pharmacy) session.getAttribute("pharmacy");
	LaboratoryList laboratoryList = (LaboratoryList) session.getAttribute("laboratoryList");
	DecimalFormat twoDec = new DecimalFormat("0.00");

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
			<TD colspan="9" align="center"><h2>Pharmacy lines</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Product</b></TD>
			<TD align="center"><b>Laboratory</b></TD>
			<TD align="center"><b>Buy Price</b></TD>
			<TD align="center"><b>Current Stock</b></TD>
			<TD align="center"><b>Min Stock</b></TD>
			<TD align="center"><b>Max Stock</b></TD>
			<TD align="center"><b>Location</b></TD>
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
			<TD align="center"><%=twoDec.format(pharmacyLine.getPrice().getBuyPrice())%> EUR </TD>
			<TD align="center"><%=pharmacyLine.getCurrentStock()%></TD>
			<TD align="center"><%=pharmacyLine.getMinStock()%></TD>
			<TD align="center"><%=pharmacyLine.getMinStock()%></TD>
			<TD align="center"><%=pharmacyLine.getLocation()%></TD>
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
		out.println(pharmacy.Size());
	%>
	
	
	
			<%
			// new option
			} else if (request.getParameter("op").equals("new")) {
				
				Product product = null;
				Laboratory laboratory = null;
				Iterator <Product> it_p = null;
				Iterator <Laboratory> it_l = null;
				String optionName = new String();
				int optionCode;

		%>
	<h3>Adding a new Pharmacy Line in the Inventory:</h3>
	<p>
	
	<FORM method="post" action="../jsp/pharmacyInventory.jsp?op=postNew">

		<TABLE align="center" BORDER=2>

			<TR>
				<TD><b>Product:</b></TD>
				<TD>
				<select name="productCode" id="productCode">
				<%
				it_p = productCatalog.getIterator();
				while (it_p.hasNext()) {
					product = it_p.next();
					optionName = product.getBrandName();
					optionCode = product.hashCode();
				%>	
						<option value="<%=optionCode%>"><%=optionName%></option>
				<%
				}				
				%>	
				</select> 
				</TD>
			</TR>
			<TR>
				<TD><b>Laboratory:</b></TD>
				<TD>
				<select name="laboratoryCode" id="laboratoryCode">
				<%
				it_l = laboratoryList.getIterator();
				while (it_l.hasNext()) {
					laboratory = it_l.next();
					optionName = laboratory.getName();
					optionCode = laboratory.hashCode();
				%>	
						<option value="<%=optionCode%>"><%=optionName%></option>
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
					
					 PharmacyLine pharmacyLine;
					 Product product;
					 Laboratory laboratory;
					
					 int productCode= Integer.parseInt(request.getParameter("productCode"));
					 int laboratoryCode= Integer.parseInt(request.getParameter("laboratoryCode"));
					 int currentStock = 0, minStock =-1, maxStock =-1;
					 double buyPrice =0 ;
					 String location = request.getParameter("location");//location= "";
					 
					 //if(!request.getParameter("location").isEmpty())
					//	 location = request.getParameter("location");
					 if(!request.getParameter("currentStock").isEmpty())
					 	currentStock = Integer.parseInt(request.getParameter("currentStock"));
					 if(!request.getParameter("minStock").isEmpty())
					 	minStock = Integer.parseInt(request.getParameter("minStock"));
					 if(!request.getParameter("maxStock").isEmpty())
					 	maxStock = Integer.parseInt(request.getParameter("maxStock"));
					 if(!request.getParameter("buyPrice").isEmpty())
					 	buyPrice =  Double.valueOf(request.getParameter("buyPrice"));
					 
					 boolean ok= false;
					 
					 product = productCatalog.getProduct(productCode);
					 laboratory = laboratoryList.getLaboratory(laboratoryCode);
					 
					 try {

					   	 	//añadiendo el producto nuevo
						 	pharmacyLine = new PharmacyLine(product, laboratory, new Price(buyPrice), currentStock, minStock, maxStock, location);	
						 	ok =pharmacy.addItem(pharmacyLine);
						 	session.setAttribute("pharmacy", pharmacy);
						}
					 catch(Exception ex)
					 {
						 System.out.println("Error saving the new Pharmacy Line: " + ex);
						 ok= false;
					 }
					

			%>
		<p>
		<%if (ok) { %>
			<b>The Pharmacy Line was create succesfully.</b> 
		<%}else { %>
			<b><font color="red">The Pharmacy Line could not be created.</font></b> 
		<%	
		 }
		%>
	
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