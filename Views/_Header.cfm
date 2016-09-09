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
		<link rel="stylesheet" type="text/css" href="../Assets/StyleSheets/Dropdown.css"/>
		<script language="javascript" src="../Assets/Scripts/Header.js"></script>

		<div class="navbar navbar-nav navbar-fixed-top">
			<br />
			<a href="../Index.cfm" class="textBlack">
				<img class="nav-item" alt="Shopping Site Logo" width="48" height="48" src="/../Assets/Images/SiteLogo.png"/>
				<h2 class="nav-item textBlack"><cfoutput>#Application.applicationName#</cfoutput></h2>
			</a>

			<form class="nav-item col-xs-6 search-div" action="/Views/Category.cfm?query=1">
				<input type="text" name="tSearch" class="nav-item form-control search-input" id="tSearch" placeholder="What do you want?" autofocus />
				<button type="submit" class="btn btn-primary nav-item search-btn" id="searchBtn" ><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
			</form>
			<cfif isDefined("Session.userName")>
				<button class="btn btn-primary nav-item dropBtn col-xs-2" onClick="dropDown()"><span class="glyphicon glyphicon-user" aria-hidden="true"> </span> <cfoutput>#Session.userName#</cfoutput></button>
				<div id="myDropdown" class="dropdown-content col-xs-2 nav-item">
					<a href="/Views/Profile.cfm">Profile</a>
					<a href="/Views/Order.cfm">Orders</a>
					<a onClick="logout()">Logout</a>
				</div>
				<cfelse>
					<button class="btn btn-primary nav-item col-xs-1" onClick="location.href='/Views/Login.cfm'"><span class="glyphicon glyphicon-log-in" aria-hidden="true"> </span> Login</button>
					<button class="btn btn-primary nav-item col-xs-1" onClick="location.href='/Views/Registration.cfm'"><span class="glyphicon glyphicon-registration-mark" aria-hidden="true"> </span> Register</button>
			</cfif>
			<button class="btn btn-primary nav-item col-xs-1 cartBtn" onClick="location.href='/Views/Cart.cfm'">
				<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"> </span>
				 Cart [<span id="cartQty"><cfoutput>#Session.totalQty#</cfoutput></span>]
			</button>
		</div>
