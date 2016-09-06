<!---
=======================================================================
 File Name	: test.cfm
 Description: This template for testing purposes only.
 Created By	: Rahul Kumar
 Created	: 30 Aug 2016
=======================================================================
--->

<!DOCTYPE html>
<html>
	<head>
		<title>Try v1.2 Bootstrap Online</title>
		<script language="javascript" src="Assets/Scripts/Dropdown.js"></script>
		<link rel="stylesheet" type="text/css" href="Assets/StyleSheets/Dropdown.css"/>
	</head>

	<cfdump var="#Session#">
	<cfdump var="#Cookie#">

	<body>
		<div class="dropdown">
			<button onclick="myFunction()" class="dropbtn"> rahul_kumar </button>
			<div id="myDropdown" class="dropdown-content">
				<a href="#">Profile</a>
				<a href="#">Orders</a>
				<a href="#">Logout</a>
			</div>
		</div>
	</body>
</html>
