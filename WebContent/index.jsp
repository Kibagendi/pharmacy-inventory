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
	//Singleton objects declaration
	Pharmacy pharmacy = Pharmacy.getInstance();
	ProductCatalog productCatalog =  ProductCatalog.getInstance();
	LaboratoryList laboratoryList = LaboratoryList.getInstance();


	if(session.isNew()){

		//Loading some basic data to work
		
		//Creating some Laboratories
		Laboratory lab1 = new Laboratory("Bayer");	
		Laboratory lab2 = new Laboratory("Menarini S.A.");	
		Laboratory lab3 = new Laboratory("Roche");
		Laboratory lab4 = new Laboratory("Glaxo Smith Kline");

		//Loading some basic products
		laboratoryList.addItem(lab1);
		laboratoryList.addItem(lab2);
		laboratoryList.addItem(lab3);
		laboratoryList.addItem(lab4);
		
		//Creating some Products
		Product product1 = new Product("Aspirin 325mg x 30 Tablets", "Acetylsalicylic Acid", "325 mg", "30", "Tablet", "Oral");
		Product product2 = new Product("Aspirin 500mg x 20 Tablets","500 mg","20");
		Product product3 = new Product("Aspirin 325mg x 100 Tablets","325 mg","100");
		Product product4 = new Product("Zaditen 5ml", "Ketolifeno","0,25 mg/ml", "5 ml", "Drops", "Ophthalmic");
		Product product5 = new Product("Artificial Tears 15ml", "Polywinl Alcohol 0,5%", "0,25 mg/ml","15 ml", "Drops", "Ophthalmic");
		Product product6 = new Product("Rinelon 15ml", "Mometasona Furoato 0,5%", "0,25 mg/ml","15 ml", "Spray", "Nasal");
		Product product7 = new Product("Loratadine 10mg", "Loratadine", "10 mg", "20", "Tablet", "Oral");
		Product product8 = new Product("Ventolin 100mg", "Salbutamol", "0,5 mg", "200", "Spray", "Nasal");
		

		//Loading some basic products
		productCatalog.addItem(product1);
		productCatalog.addItem(product2);
		productCatalog.addItem(product3);
		productCatalog.addItem(product4);
		productCatalog.addItem(product5);
		productCatalog.addItem(product6);
		productCatalog.addItem(product7);
		productCatalog.addItem(product8);
		
		//Loading some products into the pharmacy inventory
		pharmacy.addItem(new PharmacyLine(product1, lab1,new Price(9), 8, 3, 10, "A1"));
		pharmacy.addItem(new PharmacyLine(product2, lab1,new Price(8), 5, 1, 5, "A2"));
		pharmacy.addItem(new PharmacyLine(product3, lab1,new Price(10), 4, 2, 8, "A3"));
		pharmacy.addItem(new PharmacyLine(product4, lab2,new Price(15), 3, 1, 5, "A1"));
		pharmacy.addItem(new PharmacyLine(product5, lab2,new Price(20), 6, 2, 7, "A2"));
		pharmacy.addItem(new PharmacyLine(product6, lab3,new Price(11), 5));
		pharmacy.addItem(new PharmacyLine(product7, lab3,new Price(5), 3));
		pharmacy.addItem(new PharmacyLine(product8, lab4,new Price(12), 2, 1, 3, "A3"));
		
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
	<p><a href="jsp/products.jsp?op=list">Products Catalog Management</a>
	<p>
	<p><a href="jsp/pharmacyInventory.jsp?op=list">Pharmacy Inventory Management</a>
	<p>
	<p><a href="jsp/receipts.jsp?op=list">Receipts Management</a>
	<p>
	<p><a href="jsp/requests.jsp">List of Requests</a>
	<p>
	<p><a href="jsp/seller.jsp?op=start">Sell products</a>
	<p>

</body>
</html>