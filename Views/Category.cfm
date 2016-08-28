<!---
=======================================================================
 File Name	: Category.cfm
 Description: The template for displaying all the products in a particular category.
 Created By	: Rahul Kumar
 Created	: 22 Aug 2016
=======================================================================
--->

<!---
	get products of desired category from DB and
	set the variable last to either RecordCount to 20; whichever is smaller
	( because only 20 results are to be displayed per page )
--->
<cfparam name="Url.cat" default="1">
<cfif isNumeric( Url.cat ) >
	<cfset Variables.productList = Request.categoryActionObject.getProductList( Url.cat ) />
	<cfelse>
		<cfset Variables.productList = Request.categoryActionObject.getProductList( 1 ) />
</cfif>
<cfif Variables.productList.RecordCount LTE 20 >
	<cfset Variables.last = Variables.productList.RecordCount />
	<cfelse>
		<cfset Variables.last = 20 />
</cfif>

<! DOCTYPE HTML >
<html>
	<head>
		<title>Category - Shopping Site</title>
	</head>

	<body>
		<cfinclude template="/Views/_Header.cfm">

		<div class="bodyDist">
			<cfinclude template="/Views/_LeftMenuBar.cfm">

			<div class="leftNavMargin">
				<cfloop index="loopCount" from="1" to="#Variables.last#">
					<div class="prodThumbnail">
						<a href="Product.cfm?PId=<cfoutput>#Variables.productList.ProductId[loopCount]#</cfoutput>">
							<img alt="" width="200" height="300" src="../Assets/Images/Product/<cfoutput>#Variables.productList.ProductImage[loopCount]#</cfoutput>"/>
						</a>
						<p>
							<a href="Product.cfm?PId=<cfoutput>#Variables.productList.ProductId[loopCount]#</cfoutput>">
								<span><cfoutput>#Variables.productList.ProductName[loopCount]#</cfoutput></span>
							</a>
							<br />
							<span class="text-danger"> &#8377 <cfoutput>#Variables.productList.ProductPrice[loopCount]#</cfoutput></span>
						</p>
					</div>
				</cfloop>
			</div>

			<p class="clearFloat"></p>
			<div class="hiddenBox">
				<br />
				<p class="text-xs-center">
					<a href="">First</a>
					<a href="">Previous</a>
					<a href="">Page.number</a>
					<a href="">Next</a>
					<a href="">Last</a>
				</p>
				<br />
			</div>

			<cfinclude template="/Views/_Footer.cfm">
		</div>
	</body>
</html>
