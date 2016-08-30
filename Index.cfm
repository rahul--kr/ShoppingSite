<!---
=======================================================================
 File Name	: Index.cfm
 Description: The page to redirect to main page for the site.
 Created By	: Rahul Kumar
 Created	: 17 Aug 2016
=======================================================================
--->

<! DOCTYPE HTML >
<html>
	<head>
		<title>Main - Shopping Site</title>
		<link rel="shortcut icon" href="Assets/Images/FavIcon.ico" />
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="Assets/StyleSheets/BootstrapMin.css"/>
		<link rel="stylesheet" type="text/css" href="Assets/StyleSheets/CustomStyles.css"/>
		<link rel="stylesheet" type="text/css" href="Assets/StyleSheets/LeftNav.css"/>
	</head>

	<body>
		<div class="navbar navbar-nav navbar-fixed-top">
			<br />
			<a href="../Index.cfm" class="textBlack">
				<img class="nav-item" alt="Shopping Site Logo" width="48" height="48" src="/../Assets/Images/SiteLogo.png"/>
				<h2 class="nav-item textBlack"><cfoutput>#Application.applicationName#</cfoutput></h2>
			</a>

			<form class="nav-item col-xs-6">
				<input class="nav-item form-control" type="text" placeholder="What do you want?">
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

		<div class="bodyDist">
			<div class="main-menu">
				<br /> <br /> <br /> <br /> <br />
				<cfloop index="loopCount" from="1" to=#Application.categoryList.RecordCount#>
					<li class="has-subnav">
						<a href="/Views/Category.cfm?cat=<cfoutput>#Application.categoryList.CategoryId[loopCount]#</cfoutput>">
							<img width="35" height="35" src="../Assets/Images/Category/<cfoutput>#Application.categoryList.CategoryImage[loopCount]#</cfoutput>" class="leftNavMargin" />
							<span class="nav-text leftNavMargin">
								<cfoutput>#Application.categoryList.CategoryName[loopCount]#</cfoutput>
							</span>
						</a>
					</li>
					<br />
				</cfloop>
			</div>

			<noscript>
				<p class="text-danger text-xs-center">JavaScript is not enabled on your browser. Kindly enable it to continue with the website.</p>
			</noscript>

			<br class="clearFloat" />
			<div class="container-fluid panel-footer">
				<footer>
					<span class="nav-item col-lg-2">Get to know us: </span>
					<a href="" class="nav-item col-lg-1">About Us</a>
					<a href="" class="nav-item col-lg-1">Careers</a>
					<a href="" class="nav-item col-lg-1">Press</a>

					<br />

					<span class="nav-item col-lg-2">Connect with us: </span>
					<a href="" class="nav-item col-lg-1">Facebook</a>
					<a href="" class="nav-item col-lg-1">Twitter</a>
					<a href="" class="nav-item col-lg-1">Instagram</a>

					<br /> <hr />

					<p class="text-center"> &copy; <cfoutput>#Year(Now())#</cfoutput> - Shopping Site</p>
				</footer>
			</div>
		</div>

		<script src="https://code.jquery.com/jquery-3.1.0.slim.min.js" integrity="sha256-cRpWjoSOw5KcyIOaZNo4i6fZ9tKPhYYb6i5T9RSVJG8=" crossorigin="anonymous"></script>
		<script language="javascript" src="../Assets/Scripts/jquery-3.1.0.min.js"></script>
		<script language="javascript" src="../Assets/Scripts/Validations.js"></script>


	</body>
</html>
