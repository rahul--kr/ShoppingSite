<!---
=======================================================================
 File Name	: Payment.cfm
 Description: User will be prompted to choose their paymnt options and details.
 Created By	: Rahul Kumar
 Created	: 31 Aug 2016
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
		<title>Payment - Shopping Site</title>
	</head>
	<body>
		<cfinclude template="/Views/_Header.cfm">
		<cfinclude template="/Views/_NoScript.cfm">

		<div class="bodyDist">
			<cfinclude template="/Views/_LeftMenuBar.cfm">

			<br class="clearFloat" />
			<cfinclude template="/Views/_Footer.cfm">
		</div>
	</body>
</html>
