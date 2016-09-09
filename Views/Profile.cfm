<!---
=======================================================================
 File Name	: Profile.cfm
 Description: User details will show here.
 Created By	: Rahul Kumar
 Created	: 29 Aug 2016
=======================================================================
--->

<cfif isDefined( "Session.userId" ) >
	<cfset Variables.addresses = Request.checkoutActionObject.getAddresses() />
	<cfset Variables.userInfo = Request.userActionObject.getUserInfo() />
	<cfelse>
		<cflocation url="Login.cfm?errors=Please login to continue" addToken="false">
</cfif>

<! DOCTYPE HTML >
<html>
	<head>
		<title>Profile - Shopping Site</title>
	</head>
	<body>
		<div class="wrapper">
			<cfinclude template="/Views/_Header.cfm">

			<div class="bodyDist">
				<cfinclude template="/Views/_NoScript.cfm">
				<cfinclude template="/Views/_LeftMenuBar.cfm">

				<div class="userInfo">
					<h4 class="text-xs-center text-primary"> User Information </h4>
					<br />
					<p>
						<span class="infoKey"> Full Name :</span> <span class="infoVal"><cfoutput>#Variables.userInfo.Name#</cfoutput> </span>
						<button class="btn btn-outline-info"><span class="glyphicon glyphicon-edit" aria-hidden="true"> </span> </button>
					</p>

					<p>
						<span class="infoKey"> E-Mail Address :</span> <span class="infoVal"><cfoutput>#Variables.userInfo.EmailId#</cfoutput> </span>
						<button class="btn btn-outline-info"><span class="glyphicon glyphicon-edit" aria-hidden="true"> </span> </button>
					</p>

					<p>
						<span class="infoKey"> Mobile Number :</span> <span class="infoVal"><cfoutput>#Variables.userInfo.MobileNo#</cfoutput> </span>
						<button class="btn btn-outline-info"><span class="glyphicon glyphicon-edit" aria-hidden="true"> </span> </button>
					</p>
				</div>

				<br /> <br />

				<div>
					<h4 class="text-xs-center text-primary"> Saved Addresses </h4>
					<br />
					<cfif Variables.addresses.RecordCount GT 0 >
						<div class="addresses">
							<cfloop index="loopCount" from="1" to="#Variables.addresses.RecordCount#">
								<div class="address">
									<ul class="list-unstyled">
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
									</ul>
									<button class="btn btn-info col-xs-8 col-xs-offset-2" onClick=""><span class="glyphicon glyphicon-edit" aria-hidden="true"> </span> Edit</button>
								</div>
							</cfloop>
						</div>
						<br class="clearFloat" />
						<cfelse>
							<p> There are no addresses saved. </p>
					</cfif>
				</div>
			</div>
		</div>
		<br class="clearFloat" />
		<cfinclude template="/Views/_Footer.cfm">
	</body>
</html>
