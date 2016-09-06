<!---
=======================================================================
 File Name	: Order.cfm
 Description: The page to show all the orders placed by the users.
 Created By	: Rahul Kumar
 Created	: 05 Sep 2016
=======================================================================
--->

<cfif isDefined( "Session.userId" )>
	<cfset Variables.orderList = Request.userActionObject.getOrderList() />
	<cfset Variables.last = Variables.orderList.RecordCount />
	<cfelse>
		<cflocation url="Login.cfm?errors=Please login to continue" addToken="false">
</cfif>

<! DOCTYPE HTML >
<html>
	<head>
		<title>Orders - Shopping Site</title>
	</head>

	<body>

		<cfinclude template="/Views/_Header.cfm">

		<div class="bodyDist">
			<cfinclude template="/Views/_LeftMenuBar.cfm">

			<cfset Variables.orderId = 0 />
			<cfloop index="loopCount" from="1" to="#Variables.last#">
				<div class="col-xs-offset-1">
					<cfif Variables.orderId NEQ Variables.orderList.OrderId[loopCount] >
						<cfset Variables.orderId = Variables.orderList.OrderId[loopCount] />
						<cfset Variables.grandTotal = 0 />
						<span class="btn btn-primary col-xs-2"><cfoutput>#Variables.orderList.OrderId[loopCount]#</cfoutput></span>
						<br /> <br />
						<hr class="col-xs-10" />
					</cfif>
					<cfset Variables.unitPrice = Variables.orderList.ProductPrice[loopCount] + Variables.orderList.ProductShippingCost[loopCount] />
					<cfset Variables.prodPrice = Variables.unitPrice * Variables.orderList.ProductQuantity[loopCount] />
					<cfset Variables.grandTotal = Variables.grandTotal + Variables.prodPrice />
					<div class="navbar-nav col-xs-12">
						<div class="nav-item col-xs-1" >
							<img src="../Assets/Images/Product/<cfoutput>#Variables.orderList.ProductImage[loopCount]#</cfoutput>" width="40" height="50" />
						</div>
						<span class="nav-item col-xs-4"><cfoutput>#Variables.orderList.ProductName[loopCount]#</cfoutput></span>
						<span class="nav-item col-xs-3">
							<cfoutput>#numberFormat( Variables.orderList.ProductPrice[loopCount], '9.99' )#</cfoutput> +
							<cfoutput>#numberFormat( Variables.orderList.ProductShippingCost[loopCount], '9.99' )#</cfoutput>
						</span>
						<span class="nav-item col-xs-1"><cfoutput>#Variables.orderList.ProductQuantity[loopCount]#</cfoutput></span>
						<br class="clearFloat" />
						<hr class="col-xs-offset-1 col-xs-8" />
					</div>
					<br class="clearFloat" />
					<cfif Variables.orderId NEQ Variables.orderList.OrderId[loopCount+1] >
						<span class="col-xs-4"> Date Created : <cfoutput>#Variables.orderList.DateCreated[loopCount]#</cfoutput></span>
						<span class="col-xs-offset-8"><cfoutput>#Variables.grandTotal#</cfoutput></span>
						<br /> <br />
						<hr class="col-xs-10" />
					</cfif>
				</div>
			</cfloop>

			<br class="clearFloat" />
			<cfinclude template="/Views/_Footer.cfm">
		</div>

	</body>
</html>
