<!---
=======================================================================
 File Name	: Login.cfm
 Description: The template for user to login to the site.
 Created By	: Rahul Kumar
 Created	: 19 Aug 2016
=======================================================================
--->

<! DOCTYPE HTML >
<html>
	<head>
		<title>Login - Shopping Site</title>
		<script language="javascript" src="../Assets/Scripts/BasicValidation.js"></script>
		<script language="javascript" src="../Assets/Scripts/LoginValidation.js"></script>
		<script language="javascript" src="../Assets/Scripts/LoginOperations.js"></script>
	</head>

	<body>
		<cfinclude template="_Header.cfm">
		<cfinclude template="/Views/_NoScript.cfm">
		<br /> <br /> <br /> <br />
		<cfinclude template="/Views/_ListErrors.cfm" runOnce=false>

		<form name="loginForm" id="loginForm" class="form">
			<fieldset>
				<legend>Login: </legend>
				<div>
					<label for="tUName">Username<sup class="text-danger">*</sup> : </label>
					<input type="text" name="uName" class="form-control" id="tUName" placeholder="6 to 15 character string" onBlur="validateUName()" autofocus />
					<div class="text-danger text-xs-center small"><span id="pUName"></span></div>
				</div>

				<div>
					<label for="tPass">Password<sup class="text-danger">*</sup> : </label>
					<input type="password" name="pass" class="form-control" id="tPass" placeholder="8 to 15 character string" onBlur="validatePass()" />
					<div class="text-danger text-xs-center small"><span id="pPass"></span></div>
				</div>

				<p class="text-xs-center small">All the fields marked with <sup class="text-danger">*</sup> are mandatory.</p>

				<div>
					<input type="button" name="formSubmit" class="btn btn-info col-xs-4 col-xs-offset-1" id="btnSubmit" value="Login" onClick="validateLoginForm()"/>
					<input type="reset" name="formReset" class="btn btn-info col-xs-4 col-xs-offset-2" id="btnReset" value="Reset" />
				</div>
			</fieldset>
		</form>

		<br />
		<br class="clearFloat" />
		<cfinclude template="_Footer.cfm">
	</body>
</html>
