<%@ page language="java" 
	import="pharmacy.Product"
	import="pharmacy.Pharmacy"
	import="pharmacy.PharmacyLine"
	import="pharmacy.Laboratory"
	import="pharmacy.LaboratoryLine"
	import="pharmacy.LaboratoryList"
	import="pharmacy.Price"
	import="pharmacy.ProductCatalog"
	
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Pharmacy pharmacy = null;
	

	if(session.isNew()){

		//Loading some basic data to work
		
		ProductCatalog productCatalog =  new ProductCatalog();
		LaboratoryList laboratoryList = new LaboratoryList();

		pharmacy = new Pharmacy("Farmacia Don Ramon","Calle 8");
		
		//Creating some Laboratories
		Laboratory lab1 = new Laboratory("Bayer");	
		Laboratory lab2 = new Laboratory("Menarini S.A.");	
		Laboratory lab3 = new Laboratory("Roche");	

		//Loading some basic products
		laboratoryList.addItem(lab1);
		laboratoryList.addItem(lab2);
		laboratoryList.addItem(lab3);
		
		//Creating some Products
		Product product1 = new Product("Aspirin 325mg x 30 Tablets", "Acetylsalicylic Acid", "325 mg", "30", "Tablet", "Oral");
		Product product2 = new Product("Aspirin 500mg x 20 Tablets","500 mg","20");
		Product product3 = new Product("Aspirin 325mg x 100 Tablets","325 mg","100");
		Product product4 = new Product("Zaditen 5ml", "Ketolifeno", "5 ml","0,25 mg/ml", "Drops", "Ophthalmic");
		Product product5 = new Product("Artificial Tears 15ml", "Polywinl Alcohol 0,5%", "15 ml","0,25 mg/ml", "Drops", "Ophthalmic");
		Product product6 = new Product("Rinelon 15ml", "Mometasona Furoato 0,5%", "15 ml", "0,25 mg/ml", "Spray", "Nasal");
		Product product7 = new Product("Loratadine 10mg", "Loratadine", "10 mg", "20", "Tablet", "Oral");
		

		//Loading some basic products
		productCatalog.addItem(product1);
		productCatalog.addItem(product2);
		productCatalog.addItem(product3);
		productCatalog.addItem(product4);
		productCatalog.addItem(product5);
		productCatalog.addItem(product6);
		productCatalog.addItem(product7);
		
		//Loading some products into the pharmacy inventory
		pharmacy.addItem(new PharmacyLine(product1, lab1,new Price(9), 8));
		pharmacy.addItem(new PharmacyLine(product2, lab1,new Price(8), 5));
		pharmacy.addItem(new PharmacyLine(product3, lab1,new Price(10), 4));
		pharmacy.addItem(new PharmacyLine(product4, lab2,new Price(15), 3));
		pharmacy.addItem(new PharmacyLine(product5, lab2,new Price(20), 6));
		pharmacy.addItem(new PharmacyLine(product6, lab3,new Price(11), 5));
		pharmacy.addItem(new PharmacyLine(product7, lab3,new Price(5), 3));
		
		session.setAttribute("pharmacy",pharmacy);
		session.setAttribute("productCatalog",productCatalog);
		session.setAttribute("laboratoryList",laboratoryList);
	}
	else
	{
		pharmacy = (Pharmacy)session.getAttribute("pharmacy");
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacy Inventory System</title>
</head>
<body>

	<h2>Pharmacy Inventory System - <%=pharmacy.getName()%></h2>

	<BR>
	<p><a href="jsp/products.jsp?op=list">Products Catalog</a>
	<p>
	<p><a href="jsp/pharmacyInventory.jsp?op=list">Pharmacy Inventory</a>
	<p>

</body>
</html>