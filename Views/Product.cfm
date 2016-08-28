<!---
=======================================================================
 File Name	: Product.cfm
 Description: The template for displaying product related information.
 Created By	: Rahul Kumar
 Created	: 19 Aug 2016
=======================================================================
--->

<!--- get details of desired product from DB --->
<cfparam name="Url.pId" default="1">
<cfif isNumeric( Url.pId ) >
	<cfset Variables.productData = Request.productActionObject.getProductData( Url.pId ) />
	<cfelse>
		<cfset Variables.productData = Request.productActionObject.getProductData( 1 ) />
</cfif>

<! DOCTYPE HTML >
<html>
	<head>
		<title>Product - Shopping Site</title>
		<script language="javascript" src="../Assets/Scripts/CartOperations.js"></script>
	</head>

	<body>
		<cfinclude template="_Header.cfm">

		<div class="bodyDist">
			<cfinclude template="_LeftMenuBar.cfm">

			<div>
				<img class="prodImage" alt="Product Image" width="300" height="450" src="../Assets/Images/Product/<cfoutput>#Variables.productData.ProductImage#</cfoutput>"/>
				<h4><cfoutput>#Variables.productData.ProductName#</cfoutput></h4>
				<p class="text-xs-left small">by <cfoutput>#Variables.productData.ManufacturerName#</cfoutput></p>
				<hr />
				<p><span class="text-danger">Price: &#8377 <cfoutput>#Variables.productData.ProductPrice#</cfoutput></span> (Incl. of all taxes)
				<br />

				<cfif Variables.productData.ProductShippingCost GT 0 >
					+ &#8377 <cfoutput>#Variables.productData.ProductShippingCost#</cfoutput> Delivery Charges</p>
				</cfif>

				<cfif Variables.productData.UnitsInStock GT 0 >
					<button class="btn btn-primary col-xs-2" type="button" onClick="addToCart(<cfoutput>#Url.pId#</cfoutput>)"><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span> Add to Cart</button>
					<br /> <br />
					<p class="text-success">Product Available</p>
				<cfelse>
					<div class="col-xs-3">
						<input class="col-xs-2 form-control" type="text" placeholder="your email address">
					</div>
					<button class="btn btn-primary col-xs-2" type="button" onClick=""><span class="glyphicon glyphicon-envelope" aria-hidden="true"> </span> Notify Me</button>
					<br /> <br />
					<p class="text-danger">Product Unavailable</p>
				</cfif>
				<p><cfoutput>#Variables.productData.ProductDesc#</cfoutput></p>
			</div>

			<p class="clearFloat"></p>
			<cfinclude template="_Footer.cfm">
		</div>
	</body>
</html>
