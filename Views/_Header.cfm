<!---
=======================================================================
 File Name	: _Header.cfm
 Description: Partial view file containing the header section.
 Created By	: Rahul Kumar
 Created	: 17 Aug 2016
=======================================================================
--->

		<link rel="shortcut icon" href="../Assets/Images/FavIcon.ico" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../Assets/StyleSheets/BootstrapMin.css"/>
		<link rel="stylesheet" type="text/css" href="../Assets/StyleSheets/CustomStyles.css"/>

		<noscript>
			<meta http-equiv="refresh" content="0; url=/../Index.cfm">
			<p class="text-danger text-xs-center">JavaScript is not enabled on your browser. Kindly enable it to see form validation errors before submitting.</p>
		</noscript>

		<div class="navbar navbar-nav navbar-fixed-top">
			<br />
			<a href="../Index.cfm" class="textBlack">
				<img class="nav-item" alt="Shopping Site Logo" width="48" height="48" src="/../Assets/Images/SiteLogo.png"/>
				<h2 class="nav-item textBlack"><cfoutput>#Application.applicationName#</cfoutput></h2>
			</a>

			<form class="nav-item col-xs-6">
				<input class="nav-item form-control" type="text" placeholder="What do you want?" autofocus />
				<button class="btn btn-primary nav-item" type="submit" hidden>
			</form>

			<cfif isDefined("Session.userName")>
				<button class="btn btn-primary nav-item col-xs-2" onClick="location.href='/Views/Profile.cfm'"><span class="glyphicon glyphicon-user" aria-hidden="true"> </span> <cfoutput>#Session.userName#</cfoutput></button>
				<cfelse>
					<button class="btn btn-primary nav-item col-xs-1" onClick="location.href='/Views/Login.cfm'"><span class="glyphicon glyphicon-log-in" aria-hidden="true"> </span> Login</button>
					<button class="btn btn-primary nav-item col-xs-1" onClick="location.href='/Views/Registration.cfm'"><span class="glyphicon glyphicon-registration-mark" aria-hidden="true"> </span> Register</button>
			</cfif>
			<button class="btn btn-primary nav-item col-xs-1" onClick="location.href='/Views/Cart.cfm'"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"> </span> Cart</button>
		</div>
