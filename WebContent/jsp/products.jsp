<%@ page language="java" 
	import="pharmacy.Product"
	import="pharmacy.Pharmacy" 
	import="pharmacy.ProductCatalog"
	import="java.util.Iterator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	ProductCatalog productCatalog = (ProductCatalog) session.getAttribute("productCatalog");
	Pharmacy pharmacy = (Pharmacy) session.getAttribute("pharmacy");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products Catalog</title>
</head>
<body>

	<h2>Pharmacy Inventory System - <%=pharmacy.getName()%></h2>
	<p>

	<%
		if (request.getParameter("op").equals("list") ||  request.getParameter("op").equals("delete")) {

			Product product = null;			
	
			if(request.getParameter("op").equals("delete"))
			{
				int productCode = Integer.parseInt(request.getParameter("productCode"));
				product = productCatalog.getProduct(productCode);
				productCatalog.removeItem(product);
			 	session.setAttribute("productCatalog", productCatalog);
			}

			Iterator<Product> it = productCatalog.getIterator();

	%>
	<h3>Product Catalog:</h3>
	<p>
	
	<TABLE align="center" BORDER=2>
		<TR>
			<TD colspan="8" align="center"><h2> List of Products</h2></TD>
		</TR>

		<TR>
			<TD align="center"><b>Brand Name</b></TD>
			<TD align="center"><b>Primary Ingredient</b></TD>
			<TD align="center"><b>Strength</b></TD>
			<TD align="center"><b>Size/Count</b></TD>
			<TD align="center"><b>Dose Form</b></TD>
			<TD align="center"><b>Administration Route</b></TD>
			<TD align="center"><b>Edit Product</b></TD>
			<TD align="center"><b>Delete Product</b></TD>
		</TR>

		<%
			while (it.hasNext()) {
					product = it.next();
		%>
		<TR>
			<TD><%=product.getBrandName()%></TD>
			<TD><%=product.getPrimaryIngredient()%></TD>
			<TD><%=product.getStrength()%></TD>
			<TD><%=product.getSizeOrCount()%></TD>
			<TD><%=product.getDoseForm()%></TD>
			<TD><%=product.getAdministrationRoute()%></TD>
			<TD align="center"><a href="../jsp/products.jsp?op=edit&productCode=<%=product.hashCode()%>">Edit Product</a></TD>
			<TD align="center"><a href="../jsp/products.jsp?op=delete&productCode=<%=product.hashCode()%>">X</a></TD>
		</TR>
		<%
			}
		%>

	</TABLE>
	<p>
		Number of Products:
		<%
		out.println(productCatalog.Size());

	%>
	
	<p>

		<%
			// edit option
			} else if (request.getParameter("op").equals("edit")) {

				int productCode = Integer.parseInt(request.getParameter("productCode"));
				Product product = productCatalog.getProduct(productCode);
				 session.setAttribute("editProduct", product);
		%>
	<h3>Modifying Product Information:</h3>
	<p>
	
	<FORM method="post" action="../jsp/products.jsp?op=postEdit">

		<TABLE align="center" BORDER=2>

			<TR>
				<TD><b>Brand Name:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=brandName SIZE=20
					VALUE="<%=product.getBrandName()%>"></TD>
			</TR>
			<TR>
				<TD><b>Primary Ingredient:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=primaryIngredient SIZE=20
					VALUE="<%=product.getPrimaryIngredient()%>"></TD>
			</TR>
			<TR>
				<TD><b>Strength</b></TD>
				<TD><INPUT TYPE=TEXT NAME=strength SIZE=20
					VALUE="<%=product.getStrength()%>"></TD>
			</TR>
			<TR>
				<TD><b>Size/Count</b></TD>
				<TD><INPUT TYPE=TEXT NAME=sizeOrCount SIZE=20
					VALUE="<%=product.getSizeOrCount()%>"></TD>
			</TR>
			<TR>
				<TD><b>Dose Form</b></TD>
				<TD>
				<select name="doseForm" id="doseForm">
						<option value=" ">Other</option>
						<option value="Aerosol" <%=product.getDoseForm().equals("Aerosol") ? "Selected" : "" %> >Aerosol</option>
						<option value="Capsule" <%=product.getDoseForm().equals("Capsule") ? "Selected" : "" %> >Capsule</option>
						<option value="Chewable" <%=product.getDoseForm().equals("Chewable") ? "Selected" : "" %> >Chewable</option>
						<option value="Concentrate" <%=product.getDoseForm().equals("Concentrate") ? "Selected" : "" %> >Concentrate</option>
						<option value="Cream" <%=product.getDoseForm().equals("Cream") ? "Selected" : "" %> >Cream</option>
						<option value="Drops" <%=product.getDoseForm().equals("Drops") ? "Selected" : "" %> >Drops</option>
						<option value="Spray" <%=product.getDoseForm().equals("Spray") ? "Selected" : "" %> >Spray</option>
						<option value="Tablet" <%=product.getDoseForm().equals("Tablet") ? "Selected" : "" %> >Tablet</option>
				</select> 
 					</TD>
			</TR>
			<TR>
				<TD><b>Administration Route</b></TD>
				<TD>
				<select name="administrationRoute" id="administrationRoute">
						<option value=" ">Other</option>
						<option value="Buccal" <%=product.getAdministrationRoute().equals("Buccal") ? "Selected" : "" %> >Buccal</option>
						<option value="Dental" <%=product.getAdministrationRoute().equals("Dental") ? "Selected" : "" %> >Dental</option>
						<option value="Implantation" <%=product.getAdministrationRoute().equals("Implantation") ? "Selected" : "" %> >Implantation</option>
						<option value="Injection" <%=product.getAdministrationRoute().equals("Injection") ? "Selected" : "" %> >Injection</option>
						<option value="Intramuscular" <%=product.getAdministrationRoute().equals("Intramuscular") ? "Selected" : "" %> >Intramuscular</option>
						<option value="Oral" <%=product.getAdministrationRoute().equals("Oral") ? "Selected" : "" %> >Oral</option>
						<option value="Ophthalmic" <%=product.getAdministrationRoute().equals("Ophthalmic") ? "Selected" : "" %> >Ophthalmic</option>
						<option value="Nasal" <%=product.getAdministrationRoute().equals("Nasal") ? "Selected" : "" %> >Nasal</option>
				</select> 
				</TD>
			</TR> 	
			<TR>
				<TD colspan="2" align="center"><INPUT type=reset value="Reset" /><INPUT
					type=submit value="Modify" /></TD>
			</TR>

		</TABLE>
	</FORM>


			<%//postEdit
				} 
				else if (request.getParameter("op").equals("postEdit")) {
					Product product, editProduct;
					
					 String brandName= request.getParameter("brandName");
					 String primaryIngredient= request.getParameter("primaryIngredient");
					 String strength= request.getParameter("strength");
					 String sizeOrCount= request.getParameter("sizeOrCount");
					 String doseForm= request.getParameter("doseForm");
					 String administrationRoute= request.getParameter("administrationRoute");
					 boolean ok = false;
					 
					 try {
						 	//eliminando el producto anterior
						 	editProduct = (Product) session.getAttribute("editProduct");
					   	 	productCatalog.removeItem(editProduct);

					   	 	//añadiendo el producto nuevo
						 	product = new Product(brandName, primaryIngredient, strength, sizeOrCount, doseForm, administrationRoute);	
						 	ok = productCatalog.addItem(product);
						 	session.setAttribute("productCatalog", productCatalog);
						}
					 catch(Exception ex)
					 {
						 System.out.println("Error modifying product: " + ex);
						 ok = false;
					 }
					

			%>
		<p>
		<%if (ok) { %>
			<b>The Product was modify succesfully.</b> 
		<%}else { %>
			<b><font color="red">The Product could not be modify.</font></b> 
		<%	
		 }
		%>


		<p>


		<%
			// new option
			} else if (request.getParameter("op").equals("new")) {

		%>
	<h3>Adding a new Product in the Catalog:</h3>
	<p>
	
	<FORM method="post" action="../jsp/products.jsp?op=postNew">

		<TABLE align="center" BORDER=2>

			<TR>
				<TD><b>Brand Name:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=brandName SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Primary Ingredient:</b></TD>
				<TD><INPUT TYPE=TEXT NAME=primaryIngredient SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Strength</b></TD>
				<TD><INPUT TYPE=TEXT NAME=strength SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Size/Count</b></TD>
				<TD><INPUT TYPE=TEXT NAME=sizeOrCount SIZE=20></TD>
			</TR>
			<TR>
				<TD><b>Dose Form</b></TD>
				<TD>
				<select name="doseForm" id="doseForm">
						<option value=" ">Other</option>
						<option value="Aerosol">Aerosol</option>
						<option value="Capsule">Capsule</option>
						<option value="Chewable">Chewable</option>
						<option value="Concentrate">Concentrate</option>
						<option value="Cream">Cream</option>
						<option value="Drops">Drops</option>
						<option value="Spray">Spray</option>
						<option value="Tablet">Tablet</option>
				</select> 
 					</TD>
			</TR>
			<TR>
				<TD><b>Administration Route</b></TD>
				<TD>
				<select name="administrationRoute" id="administrationRoute">
						<option value=" ">Other</option>
						<option value="Buccal">Buccal</option>
						<option value="Dental">Dental</option>
						<option value="Implantation">Implantation</option>
						<option value="Injection">Injection</option>
						<option value="Intramuscular">Intramuscular</option>
						<option value="Oral">Oral</option>
						<option value="Ophthalmic">Ophthalmic</option>
						<option value="Nasal">Nasal</option>
				</select> 
					</TD>
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
					 boolean ok = false;

					 try {

					   	 	//añadiendo el producto nuevo
						 	product = new Product(brandName, primaryIngredient, strength, sizeOrCount, doseForm, administrationRoute);	
						 	ok = productCatalog.addItem(product);
						 	session.setAttribute("productCatalog", productCatalog);
						}
					 catch(Exception ex)
					 {
						 System.out.println("Error saving the new product: " + ex);
						 ok = false;
					 }
					

			%>
		<p>
		<%if (ok) { %>
			<b>The Product was create succesfully.</b> 
		<%}else { %>
			<b><font color="red">The Product could not be created.</font></b> 
		<%	
		 }
		%>

		<p>
	<%
	 }
	%>
		<p>
			<a href="../jsp/products.jsp?op=list">List of Products</a>
		<p>
			<a href="../jsp/products.jsp?op=new">Add a new Product in the catalog</a>
		<p>
			<a href="../index.jsp">Home</a>
		<p>
</body>
</html>