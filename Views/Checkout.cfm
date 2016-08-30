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
	</head>
	<body>
		<cfinclude template="/Views/_Header.cfm">

		<div class="bodyDist">
			<cfinclude template="/Views/_LeftMenuBar.cfm">

			<cfif isDefined( "Variables.addresses" ) >
				<h4>Select a delivery Address</h4>
				<div>
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
							<button class="btn btn-info col-xs-8 col-xs-offset-2"><span class="glyphicon glyphicon-inbox" aria-hidden="true"> </span> Deliver here</button>
						</div>
					</cfloop>
				</div>
			</cfif>

			<br class="clearFloat" />
			<h4>Enter a delivery address</h4>
			<form name="addressForm" class="halfWidth">
				<fieldset>
					<div>
						<label for="tHouseNo">House No.<sup class="text-danger">*</sup> : </label>
						<input type="text" name="houseNo" class="form-control" id="tHouseNo" />
						<div class="text-danger text-xs-center small"><span id="pHouseNo"></span></div>
					</div>

					<div>
						<label for="tStreet">Street<sup class="text-danger">*</sup> : </label>
						<input type="text" name="street" class="form-control" id="tStreet" />
						<div class="text-danger text-xs-center small"><span id="pStreet"></span></div>
					</div>

					<div>
						<label for="tPostalCode">Postal Code<sup class="text-danger">*</sup> : </label>
						<input type="text" name="postalCode" class="form-control" id="tPostalCode" />
						<div class="text-danger text-xs-center small"><span id="pPostalCode"></span></div>
					</div>

					<div>
						<label for="tCity">City<sup class="text-danger">*</sup> : </label>
						<input type="text" name="city" class="form-control" id="tCity" />
						<div class="text-danger text-xs-center small"><span id="pCity"></span></div>
					</div>

					<div>
						<label for="tState">State<sup class="text-danger">*</sup> : </label>
						<input type="text" name="state" class="form-control" id="tState" />
						<div class="text-danger text-xs-center small"><span id="pState"></span></div>
					</div>

					<div>
						<label for="tCountry">Country<sup class="text-danger">*</sup> : </label>
						<input type="text" name="country" class="form-control" id="tCountry" />
						<div class="text-danger text-xs-center small"><span id="pCountry"></span></div>
					</div>

					<p class="text-xs-center small">All the fields marked with <sup class="text-danger">*</sup> are mandatory.</p>

					<div>
						<button name="formSubmit" class="btn btn-info col-xs-6 col-xs-offset-3" id="btnSubmit" onClick="validateForm()" ><span class="glyphicon glyphicon-plus" aria-hidden="true"> </span> Add address and Proceed to pay</button>
					</div>
				</fieldset>
			</form>

			<br class="clearFloat" />
			<cfinclude template="/Views/_Footer.cfm">
		</div>
	</body>
</html>
