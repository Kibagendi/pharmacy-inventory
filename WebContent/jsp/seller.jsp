<%@ page language="java" 
	import="pharmacy.Product"
	import="pharmacy.ShoppingLine"
	import="pharmacy.ShoppingCar"
	import="pharmacy.Price"
	import="pharmacy.Pharmacy"
	import="pharmacy.PharmacyLine"
	import="pharmacy.LaboratoryList"
	import="pharmacy.Laboratory"
	import="pharmacy.ProductCatalog"
	import="java.util.Iterator"		
	import="java.util.Date"
	import="java.text.DecimalFormat"
	import="java.text.DateFormat"
	import="java.text.SimpleDateFormat"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//Singleton objects declaration
	Pharmacy pharmacy = Pharmacy.getInstance();
	ProductCatalog productCatalog =  ProductCatalog.getInstance();
	LaboratoryList laboratoryList = LaboratoryList.getInstance();


	DecimalFormat twoDec = new DecimalFormat("0.00");
	DateFormat df = new SimpleDateFormat ("yyyyMMddHHmmss");
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
		if (request.getParameter("op").equals("start") || request.getParameter("op").equals("continue")) {

			PharmacyLine pharmacyLine = null;
			Iterator<PharmacyLine> it = pharmacy.getIterator();
			String optionName = new String();
			int optionCode;
			int shoppingCarId;
			
			ShoppingCar shoppingCar = null;
					
			if(request.getParameter("op").equals("start") ){
				shoppingCarId = pharmacy.numberOfShoppingCars() + 1;
				shoppingCar = new ShoppingCar("Roberto Gomez", shoppingCarId);
				pharmacy.addShoppingCarItem(shoppingCar);
			}
			else{//continue
				shoppingCarId = Integer.parseInt(request.getParameter("shoppingCarId"));
			}
	%>
	<h3>Sell Products - Shopping Car #<%=shoppingCarId%>:</h3>
	<p>
	
	<FORM method="post" action="../jsp/seller.jsp?op=add">

	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="2" align="center"><h2>Pharmacy lines</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Pharmacy Line:</b></TD>
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
		</TR>
		<TR>
			<TD align="center"><b>Quantity:</b></TD>
		
			<TD><input type="text" name="quantity" /></TD>
		</TR>


	</TABLE>

	<p> <p>
	<TABLE align="center" BORDER=0>	
		<TR>
			<TD align="center">
				<INPUT type=submit value="Add to shopping car" />
				<INPUT type="hidden" name="shoppingCarId" value="<%=shoppingCarId%>" />
			</TD>
		</TR>
	</TABLE>

	</FORM>
	
	<p> <p>	
	
	<TABLE align="center" BORDER=0>	
			<TR>
			<TD align="center">
				<FORM method="post" action="../jsp/seller.jsp?op=finish&shoppingCarId=<%=shoppingCarId%>">
					<INPUT type=submit value="Finish shopping"  />
				</FORM>
			</TD>
			<TD align="center">
				<FORM method="post" action="../jsp/seller.jsp?op=cancel&shoppingCarId=<%=shoppingCarId%>">
					<INPUT type=submit value="Cancel shopping" />
				</FORM>	
			</TD>
			</TR>

	</TABLE>
	
	<%
		} else if (request.getParameter("op").equals("cancel")) {
			int shoppingCarId = Integer.parseInt(request.getParameter("shoppingCarId"));
			ShoppingCar shoppingCar = pharmacy.getShoppingCar(shoppingCarId-1);
			shoppingCar.cancelShoppingCar();
					
	%>

	<h3>Canceling Shopping Car:</h3>
	<p>
	<b><font color="red">The Shopping Car was canceled.</font></b> 
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<TABLE align="center" BORDER=0>
	<TR><TD align="center"><a href="../index.jsp">Home</a></TD></TR>
	</TABLE>


	<%
		} else if (request.getParameter("op").equals("finish")) {
			int shoppingCarId = Integer.parseInt(request.getParameter("shoppingCarId"));
			ShoppingCar shoppingCar = pharmacy.getShoppingCar(shoppingCarId-1);
			shoppingCar.closeShoppingCar();
	%>

	<h3>Finishing Shopping:</h3>
	<p>
	<b><font color="black">The Shopping process is complete.</font></b> 
	
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>

	<TABLE align="center" BORDER=0>
	<TR><TD align="center"><a href="../jsp/seller.jsp?op=list">List of Shopping Cars</a></TD></TR>
	<TR><TD align="center"><a href="../index.jsp">Home</a></TD></TR>
	</TABLE>

	<%
		} else if (request.getParameter("op").equals("list") ) {

	%>
	<h3>List of Shopping Cars:</h3>
	<p>
	
	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="5" align="center"><h2>List of Shopping Cars</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Number</b></TD>
			<TD align="center"><b>Client</b></TD>
			<TD align="center"><b>Date</b></TD>
			<TD align="center"><b>Total Price</b></TD>
			<TD align="center"><b>State</b></TD>
		</TR>

		<%
			ShoppingCar shoppingCar = null;
			int i=0;
			Iterator<ShoppingCar> it = pharmacy.getShoppingCarIterator();

			while (it.hasNext()) {
				shoppingCar = it.next();
				i++;
		%>
		<TR>
			<TD align="center"><a href="../jsp/seller.jsp?op=shoppingCar&shoppingCarId=<%=shoppingCar.getShoppingCarId()%>"><b><%=i%></b></a></TD>			
			<TD><%=shoppingCar.getClient()%></TD>
			<TD><%=shoppingCar.getCreationDateString()%></TD>
			<TD align="center"><%=twoDec.format(shoppingCar.getTotalPrice())%></TD>
			<TD align="center"><%=shoppingCar.getState()%></TD>
		</TR>
		<%
			}
		%>

	</TABLE>

	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>

	<TABLE align="center" BORDER=0>
	<TR><TD align="center"><a href="../jsp/seller.jsp?op=start">Sell Products</a></TD></TR>
	<TR><TD align="center"><a href="../index.jsp">Home</a></TD></TR>
	</TABLE>
	<%
		} else if (request.getParameter("op").equals("add")|| request.getParameter("op").equals("delete")) {
			boolean ok = false;
			int shoppingCarId = Integer.parseInt(request.getParameter("shoppingCarId"));
			int pharmacyLineCode = Integer.parseInt(request.getParameter("pharmacyLineCode"));
			PharmacyLine pharmacyLine = pharmacy.getPharmacyLine(pharmacyLineCode);
			
			ShoppingCar shoppingCar = pharmacy.getShoppingCar(shoppingCarId-1);
			int quantity=0; 
			
			if (request.getParameter("op").equals("add")){
				
				if(!request.getParameter("quantity").isEmpty())
					quantity = Integer.parseInt(request.getParameter("quantity"));

				String shoppingLineKey =  df.format(new Date());
				double totalPrice;
	
				if (pharmacyLine.takeOutPharmacyLine(quantity)) {
			
					totalPrice = quantity * pharmacyLine.getPrice().getSellPrice();
	
					ok = shoppingCar.addItem(shoppingLineKey, new ShoppingLine(pharmacyLine, quantity, totalPrice));
				}
	%>
	<h3>Selling Products:</h3>
	<p>
			<%
				if (ok) {
			%>
				<b>The product was add to the Shopping Car.</b> 
			<%
	 			}else {
	 		%>
				<b><font color="red">The product could not be added to the Shopping Car.</font></b> 
			<%
 			}
		} else{//delete option
			
			String shoppingLineKey = request.getParameter("shoppingLineKey");
			ok = false;
			
			if (pharmacyLine.putInPharmacyLine(shoppingCar.getItem(shoppingLineKey).getQuantity())) {
				
				ok = shoppingCar.removeItem(shoppingLineKey);
			}
		%>
	<h3>Selling Products:</h3>
	<p>
		<%
			if (ok) {
 		%>
			<b>The product was delete from the Shopping Car.</b> 
		<%
 			}else {
 		%>
			<b><font color="red">The product could not be deleted from the Shopping Car.</font></b> 
		<%
 			}
		}
	 	%>
	
		<p>

	<FORM method="post" action="../jsp/seller.jsp?op=continue">

	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="7" align="center"><h2>Shopping Car #<%=shoppingCarId%>:</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Number</b></TD>
			<TD align="center"><b>Product</b></TD>
			<TD align="center"><b>Laboratory</b></TD>
			<TD align="center"><b>Quantity</b></TD>
			<TD align="center"><b>Unit Price</b></TD>
			<TD align="center"><b>Total Price</b></TD>
			<TD align="center"><b>Delete</b></TD>
		</TR>
		<%
			Iterator <String> it_sc = shoppingCar.getIterator();
			ShoppingLine shoppingLine;
			String shoppingLineKey;
			int i = 0;
			//PharmacyLine pharmacyLine;
			while (it_sc.hasNext()) {
				shoppingLineKey = it_sc.next();
				i++;
				//System.out.println("it-shoppingLinekey:"+shoppingLinekey);
				shoppingLine = shoppingCar.getItem(shoppingLineKey);
				//System.out.println("shoppingLine:"+shoppingLine.hashCode());
				pharmacyLine = shoppingLine.getPharmacyLine();
				//System.out.println("pharmacyLine:"+pharmacyLineAdd.hashCode());
		%>
		<TR>
			<TD><%=i%></TD>
			<TD><%=pharmacyLine.getProduct().getBrandName()%></TD>
			<TD><%=pharmacyLine.getLaboratory().getName()%></TD>
			<TD align="center"><%=shoppingLine.getQuantity()%></TD>
			<TD align="center"><%=twoDec.format(pharmacyLine.getPrice().getSellPrice())%> EUR </TD>
			<TD align="center"><%=twoDec.format(shoppingLine.getTotalPrice())%> EUR </TD>
			<TD align="center"><a href="../jsp/seller.jsp?op=delete&shoppingLineKey=<%=shoppingLineKey%>&pharmacyLineCode=<%=pharmacyLine.hashCode()%>&shoppingCarId=<%=shoppingCar.getShoppingCarId()%>">X</a></TD>			
		</TR>

				<%
					}
				%>	

		<TR>
			<TD colspan="5" align="right"><b>Total:  </b></TD>
			<TD  align="center"><b><%= twoDec.format(shoppingCar.getTotalPrice())%> EUR </b></TD>
			<TD> </TD>
		</TR>
	</TABLE>

	<p> <p>
	<TABLE align="center" BORDER=0>	
		<TR>
			<TD align="center">
				<INPUT type=submit value="Continue Shopping" />
				<INPUT type="hidden" name="shoppingCarId" value="<%=shoppingCar.getShoppingCarId()%>" />
			</TD>
		</TR>
	</TABLE>


	</FORM>

	<p> <p>
		<TABLE align="center" BORDER=0>	
			<TR>
			<TD align="center">
				<FORM method="post" action="../jsp/seller.jsp?op=finish&shoppingCarId=<%=shoppingCarId%>">
					<INPUT type=submit value="Finish shopping"  />
				</FORM>
			</TD>
			<TD align="center">
				<FORM method="post" action="../jsp/seller.jsp?op=cancel&shoppingCarId=<%=shoppingCarId%>">
					<INPUT type=submit value="Cancel shopping" />
				</FORM>	
			</TD>
			</TR>

	</TABLE>
	
	<%
		} else if (request.getParameter("op").equals("shoppingCar")) {
			boolean ok = false;
			int shoppingCarId = Integer.parseInt(request.getParameter("shoppingCarId"));
			
			ShoppingCar shoppingCar = pharmacy.getShoppingCar(shoppingCarId-1);
			int quantity=0; 
			
	%>
	<h3>Shopping Car Details:</h3>
	<p>


	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="6" align="center"><h2>Shopping Car #<%=shoppingCarId%>:</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Number</b></TD>
			<TD align="center"><b>Product</b></TD>
			<TD align="center"><b>Laboratory</b></TD>
			<TD align="center"><b>Quantity</b></TD>
			<TD align="center"><b>Unit Price</b></TD>
			<TD align="center"><b>Total Price</b></TD>
		</TR>
		<%
			Iterator <String> it_sc = shoppingCar.getIterator();
			ShoppingLine shoppingLine;
			String shoppingLineKey;
			int i = 0;
			PharmacyLine pharmacyLine;
			while (it_sc.hasNext()) {
				shoppingLineKey = it_sc.next();
				i++;
				//System.out.println("it-shoppingLinekey:"+shoppingLinekey);
				shoppingLine = shoppingCar.getItem(shoppingLineKey);
				//System.out.println("shoppingLine:"+shoppingLine.hashCode());
				pharmacyLine = shoppingLine.getPharmacyLine();
				//System.out.println("pharmacyLine:"+pharmacyLineAdd.hashCode());
		%>
		<TR>
			<TD><%=i%></TD>
			<TD><%=pharmacyLine.getProduct().getBrandName()%></TD>
			<TD><%=pharmacyLine.getLaboratory().getName()%></TD>
			<TD align="center"><%=shoppingLine.getQuantity()%></TD>
			<TD align="center"><%=twoDec.format(pharmacyLine.getPrice().getSellPrice())%> EUR </TD>
			<TD align="center"><%=twoDec.format(shoppingLine.getTotalPrice())%> EUR </TD>
		</TR>

				<%
					}
				%>	

		<TR>
			<TD colspan="5" align="right"><b>Total:  </b></TD>
			<TD  align="center"><b><%= twoDec.format(shoppingCar.getTotalPrice())%> EUR </b></TD>
		</TR>
	</TABLE>

	<BR>
	<BR>
	<BR>
	<BR>
	<BR>
	<BR>


	<TABLE align="center" BORDER=0>
	<TR><TD align="center"><a href="../jsp/seller.jsp?op=list">Shopping Car List</a></TD></TR>
	<TR><TD align="center"><a href="../jsp/seller.jsp?op=start">Sell Products</a></TD></TR>
	<TR><TD align="center"><a href="../index.jsp">Home</a></TD></TR>
	</TABLE>
	
	<%
	} //shoppingCar
	%>
</body>
</html>