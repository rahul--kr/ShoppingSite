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
	</head>

	<body>

		<cfinclude template="/Views/_Header.cfm">

		<div class="bodyDist">
			<cfinclude template="/Views/_LeftMenuBar.cfm">

			<noscript>
				<p class="text-danger text-xs-center">JavaScript is not enabled on your browser. Kindly enable it to continue with the website.</p>
			</noscript>

			<br class="clearFloat" />
			<cfinclude template="/Views/_Footer.cfm">
		</div>

		<script src="https://code.jquery.com/jquery-3.1.0.slim.min.js" integrity="sha256-cRpWjoSOw5KcyIOaZNo4i6fZ9tKPhYYb6i5T9RSVJG8=" crossorigin="anonymous"></script>
		<script language="javascript" src="../Assets/Scripts/Header.js"></script>
	</body>
</html>
