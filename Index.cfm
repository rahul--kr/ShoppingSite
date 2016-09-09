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
		<div class="wrapper">
			<cfinclude template="/Views/_Header.cfm">

			<div class="bodyDist">

				<noscript>
					<p class="text-danger text-xs-center">JavaScript is not enabled on your browser. Kindly enable it to continue with the website.</p>
				</noscript>

				<cfinclude template="/Views/_LeftMenuBar.cfm">

				<br class="clearFloat" />
			</div>
		</div>
		<br class="clearFloat" />
		<cfinclude template="/Views/_Footer.cfm">
	</body>
</html>
