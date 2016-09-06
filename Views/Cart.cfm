<!---
=======================================================================
 File Name	: Cart.cfm
 Description: Items users have added to cart will show here.
 Created By	: Rahul Kumar
 Created	: 22 Aug 2016
=======================================================================
--->

<cfif NOT StructIsEmpty( Session.cart ) >
	<cfset Variables.cartData = Request.cartActionObject.getCartDetails( Session.cart ) />
</cfif>
<cfparam name="Variables.cartData" default=#arrayNew(1)#>

<! DOCTYPE HTML >
<html>
	<head>
		<title>Cart - Shopping Site</title>
		<script language="javascript" src="../Assets/Scripts/CartOperations.js"></script>
	</head>

	<body>
		<cfinclude template="/Views/_Header.cfm">
		<cfinclude template="/Views/_NoScript.cfm">

		<div class="bodyDist">
			<cfinclude template="/Views/_LeftMenuBar.cfm">

			<cfif NOT structIsEmpty( Session.cart ) >
				<table>
					<tr class="cartData">
						<th class="col-xs-3"> Item </th>
						<th class="col-xs-1"> Quantity </th>
						<th class="col-xs-1"> Unit Price</th>
						<th class="col-xs-1"> Unit Shipping Cost</th>
						<th class="col-xs-1"> Subtotal </th>
					</tr>
					<cfset Variables.grandTotal = 0 >
					<cfloop index="loopCount" from="1" to="#ArrayLen( Variables.cartData )#">
						<tr class="cartData">
							<td class="col-xs-3">
								<a href="Product.cfm?PId=<cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput>">
									<img width="50" height="70" src="../Assets/Images/Product/<cfoutput>#Variables.cartData[loopCount].ProductImage#</cfoutput>"/>
									&nbsp;
									<span><cfoutput>#Variables.cartData[loopCount].ProductName#</cfoutput></span>
								</a>
							</td>

							<cfset Variables.costPerItem = Variables.cartData[loopCount].ProductPrice + Variables.cartData[loopCount].ProductShippingCost >
							<cfset Variables.subtotal = (Variables.cartData[loopCount].ProductPrice + Variables.cartData[loopCount].ProductShippingCost) * StructFind( Session.cart, Variables.cartData[loopCount].ProductId ) >
							<cfset Variables.grandTotal = Variables.grandTotal + Variables.subtotal >

							<td class="col-xs-1">
								<button class="btn btn-secondary" onClick="decreaseQuantity( <cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput>, <cfoutput>#Variables.costPerItem#</cfoutput> )"><span class="glyphicon glyphicon-minus"></button>
								<span id="prodQty<cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput>"> <cfoutput> #StructFind( Session.cart, Variables.cartData[loopCount].ProductId )# </cfoutput> </span>
								<button class="btn btn-secondary" onClick="increaseQuantity( <cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput>, <cfoutput>#Variables.costPerItem#</cfoutput>, <cfoutput>#Variables.cartData[loopCount].UnitsInStock#</cfoutput> )"> <span class="glyphicon glyphicon-plus"></button>
							</td>

							<td class="col-xs-1"> <span><cfoutput>#numberFormat( Variables.cartData[loopCount].ProductPrice, '9.99' )#</cfoutput></span> </td>
							<td class="col-xs-1"> <span><cfoutput>#numberFormat( Variables.cartData[loopCount].ProductShippingCost, '9.99' )#</cfoutput></span> </td>
							<td class="col-xs-1" id="prodSubtotal<cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput>"> <cfoutput>#Variables.subtotal#</cfoutput> </td>
						</tr>
					</cfloop>
				</table>
				<hr class="cartHr" />
				<p class="text-lg-right cartP"> Grand Total: <span id="gTotal"><cfoutput>#Variables.grandTotal#</cfoutput></span> </p>
				<a href="Checkout.cfm"><button class="btn btn-info col-xs-2 col-lg-offset-5"><span class="glyphicon glyphicon-check"> </span> Place Order</button></a>

				<cfelse>
					<h4 class="text-lg-center">There is no item in you cart.</h4>
					<a href="../Index.cfm"><button class="btn btn-info col-xs-2 col-lg-offset-5"><span class="glyphicon glyphicon-home" aria-hidden="true"> </span> Continue Shopping</button></a>
			</cfif>

			<p class="clearFloat"></p>
			<cfinclude template="/Views/_Footer.cfm">
		</div>
	</body>
</html>
