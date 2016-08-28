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
					<cfloop index="loopCount" from="1" to="#ArrayLen( Variables.cartData )#">
						<tr class="cartData">
							<td class="col-xs-3">
								<img width="50" height="70" src="../Assets/Images/Product/<cfoutput>#Variables.cartData[loopCount].ProductImage#</cfoutput>"/>
								&nbsp; &nbsp;
								<span><cfoutput>#Variables.cartData[loopCount].ProductName#</cfoutput></span>
							</td>
							<td class="col-xs-1">
								<button class="btn btn-secondary" onClick="decreaseQuantity( <cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput> )"><span class="glyphicon glyphicon-minus"></button>
								<span id="prodQty<cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput>"> <cfoutput> #StructFind( Session.cart, Variables.cartData[loopCount].ProductId )# </cfoutput> </span>
								<button class="btn btn-secondary" onClick="increaseQuantity( <cfoutput>#Variables.cartData[loopCount].ProductId#</cfoutput>, <cfoutput>#Variables.cartData[loopCount].UnitsInStock#</cfoutput> )"> <span class="glyphicon glyphicon-plus"></button>
							</td>

							<td class="col-xs-1"> <span><cfoutput>#Variables.cartData[loopCount].ProductPrice#</cfoutput></span> </td>
							<td class="col-xs-1"> <span><cfoutput>#Variables.cartData[loopCount].ProductShippingCost#</cfoutput></span> </td>
							<td class="col-xs-1"> Product.Total </td>
						</tr>
					</cfloop>
				</table>
				<cfelse>
					<h4 class="text-md-center">There is no item in you cart.</h4>
					<a href="../Index.cfm"><button class="btn btn-primary col-xs-2"><span class="glyphicon glyphicon-home" aria-hidden="true"> </span> Continue Shopping</button></a>
			</cfif>

			<p class="clearFloat"></p>
			<cfinclude template="/Views/_Footer.cfm">
		</div>
	</body>
</html>
