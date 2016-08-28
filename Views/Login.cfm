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
		<br /> <br /> <br /> <br />
		<cfinclude template="/Views/_ListErrors.cfm" runOnce=false>

		<form name="regForm" id="loginForm">
			<fieldset>
				<legend>Create Account: </legend>
				<div>
					<label for="tUName">Username<sup class="text-danger">*</sup> : </label>
					<input type="text" name="uName" class="form-control" id="tUName" placeholder="6 to 15 character string" onBlur="validateUName()" />
					<div class="text-danger text-xs-center small"><span id="pUName"></span></div>
				</div>

				<div>
					<label for="tPass">Password<sup class="text-danger">*</sup> : </label>
					<input type="password" name="pass" class="form-control" id="tPass" placeholder="8 to 15 character string" onBlur="validatePass()" />
					<div class="text-danger text-xs-center small"><span id="pPass"></span></div>
				</div>

				<p class="text-xs-center small">All the fields marked with <sup class="text-danger">*</sup> are mandatory.</p>

				<div>
					<input type="button" name="formSubmit" class="btn btn-lg col-xs-5" id="btnSubmit" value="Login" onClick="validateLoginForm()"/>
					<input type="reset" name="formSubmit" class="btn btn-lg col-xs-5" id="btnSubmit" value="Reset" />
				</div>

			</fieldset>
		</form>

		<br />
		<p class="clearFloat"></p>
		<cfinclude template="_Footer.cfm">
	</body>
</html>
