<!---
=======================================================================
 File Name	: Checkout.cfm
 Description: This is the template for users to add/select address for delivering orders.
 Created By	: Rahul Kumar
 Created	: 29 Aug 2016
=======================================================================
--->

<cfif isDefined( "Session.userId" ) >
	<cfset Variables.addresses = Request.checkoutActionObject.getAddresses() />
	<cfelse>
		<cflocation url="Login.cfm?errors=Please login to continue" addToken="false">
</cfif>

<! DOCTYPE HTML >
<html>
	<head>
		<title>Checkout - Shopping Site</title>
		<script language="javascript" src="../Assets/Scripts/BasicValidation.js"></script>
		<script language="javascript" src="../Assets/Scripts/CheckoutOperations.js"></script>
	</head>

	<body>
		<div class="wrapper">
		<cfinclude template="/Views/_Header.cfm">

			<div class="bodyDist">
				<cfinclude template="/Views/_NoScript.cfm">
				<cfinclude template="/Views/_LeftMenuBar.cfm">

				<p class="text-xl-center"><input type="radio" name="payBy" value="cod" checked> Pay by 'Cash on Delivery'</p>
				<br>

				<cfif Variables.addresses.RecordCount GT 0 >
					<h4 class="text-md-center text-primary">Select a delivery Address</h4>
					<br />
					<div class="addresses">
						<cfloop index="loopCount" from="1" to="#Variables.addresses.RecordCount#">
							<div class="address">
								<ul class="list-unstyled">
									<li><b><cfoutput>#Variables.addresses.Name[loopCount]#</cfoutput></b></li>
									<hr />
									<li><cfoutput>#Variables.addresses.HouseNo[loopCount]#</cfoutput></li>
									<li><cfoutput>#Variables.addresses.Street[loopCount]#</cfoutput></li>
									<li>
										<cfoutput>#Variables.addresses.City[loopCount]#</cfoutput> -
										<cfoutput>#Variables.addresses.PostalCode[loopCount]#</cfoutput>
									</li>
									<li><cfoutput>#Variables.addresses.State[loopCount]#</cfoutput></li>
									<li><cfoutput>#Variables.addresses.Country[loopCount]#</cfoutput></li>
									<hr />
									<li><cfoutput>#Variables.addresses.MobileNo[loopCount]#</cfoutput></li>
								</ul>
								<button class="btn btn-info col-xs-8 col-xs-offset-2" onClick="checkout( <cfoutput>#Variables.addresses.UserShippingId[loopCount]#</cfoutput> )"><span class="glyphicon glyphicon-inbox" aria-hidden="true"> </span> Deliver here</button>
							</div>
						</cfloop>
					</div>
					<br class="clearFloat" />
					<h2 class="text-md-center text-warning">OR</h2>
				</cfif>

				<br />
				<h4 class="text-md-center text-primary">Enter a new delivery address</h4>
				<cfinclude template="/Views/_ListErrors.cfm" runOnce=false>
				<form name="addressForm" class="form">
					<fieldset>
						<div class="form-group">
							<label for="tHouseNo">House No.<sup class="text-danger">*</sup> : </label>
							<input type="text" name="houseNo" class="form-control" id="tHouseNo" placeholder="house no, locality" onBlur="validateAddrLine(1)" />
							<div class="text-danger text-xs-center small"><span id="pHouseNo"></span></div>
						</div>

						<div class="form-group">
							<label for="tStreet">Street<sup class="text-danger">*</sup> : </label>
							<input type="text" name="street" class="form-control" id="tStreet" placeholder="street/lane" onBlur="validateAddrLine(2)" />
							<div class="text-danger text-xs-center small"><span id="pStreet"></span></div>
						</div>

						<div class="form-group">
							<label for="tPostalCode">Postal Code<sup class="text-danger">*</sup> : </label>
							<input type="text" name="postalCode" class="form-control" id="tPostalCode" placeholder="pin/zip code" onBlur="validatePin()" />
							<div class="text-danger text-xs-center small"><span id="pPostalCode"></span></div>
						</div>

						<div class="form-group">
							<label for="tCity">City<sup class="text-danger">*</sup> : </label>
							<input type="text" name="city" class="form-control" id="tCity" placeholder="village, city" onBlur="validateCity()" />
							<div class="text-danger text-xs-center small"><span id="pCity"></span></div>
						</div>

						<div class="form-group">
							<label for="tState">State<sup class="text-danger">*</sup> : </label>
							<input type="text" name="state" class="form-control" id="tState" placeholder="state/province" onBlur="validateState()" />
							<div class="text-danger text-xs-center small"><span id="pState"></span></div>
						</div>

						<div class="form-group">
							<label for="tCountry">Country<sup class="text-danger">*</sup> : </label>
							<input type="text" name="country" class="form-control" id="tCountry" placeholder="country" onBlur="validateCountry()" />
							<div class="text-danger text-xs-center small"><span id="pCountry"></span></div>
						</div>

						<p class="text-xs-center small">All the fields marked with <sup class="text-danger">*</sup> are mandatory.</p>

						<div>
							<input type="button" name="formSubmit" class="btn btn-info col-xs-8 col-xs-offset-2" id="btnSubmit" value="Add address and Proceed to pay" onClick="addAddrCheckout()" />
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<br class="clearFloat" />
		<cfinclude template="/Views/_Footer.cfm">
	</body>
</html>
