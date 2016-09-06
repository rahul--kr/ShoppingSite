<!---
=======================================================================
 File Name	: Registration.cfm
 Description: The template for new users to register on the site.
 Created By	: Rahul Kumar
 Created	: 19 Aug 2016
=======================================================================
--->

<! DOCTYPE HTML >
<html>
	<head>
		<title>Register - Shopping Site</title>
		<script language="javascript" src="../Assets/Scripts/BasicValidation.js"></script>
		<script language="javascript" src="../Assets/Scripts/LoginValidation.js"></script>
		<script language="javascript" src="../Assets/Scripts/RegistrationOperations.js"></script>
	</head>

	<body>
		<cfinclude template="_Header.cfm">
		<br /> <br /> <br /> <br />
		<cfinclude template="/Views/_ListErrors.cfm" runOnce=false>
		<cfinclude template="/Views/_NoScript.cfm">

		<form name="regForm" id="regForm" class="form">
			<fieldset>
				<legend>Create Account: </legend>
				<div>
					<label for="tUName">Username<sup class="text-danger">*</sup> : </label>
					<input type="text" name="uName" class="form-control" id="tUName" placeholder="6 to 15 character string" onBlur="validateUName()" />
					<div class="text-danger text-xs-center small"><span id="pUName"></span></div>
				</div>

				<div>
					<label for="tEMail">Email Address<sup class="text-danger">*</sup> : </label>
					<input type="text" name="eMail" class="form-control" id="tEMail" placeholder="user@example.com" onBlur="validateEMail()" autofocus />
					<div class="text-danger text-xs-center small"><span id="pEMail"></span></div>
				</div>

				<div>
					<label for="tPass">Password<sup class="text-danger">*</sup> : </label>
					<input type="password" name="pass" class="form-control" id="tPass" placeholder="8 to 15 character string" onBlur="validatePass()" />
					<div class="text-danger text-xs-center small"><span id="pPass"></span></div>
				</div>

				<div>
					<label for="cnfPass">Confirm Password<sup class="text-danger">*</sup> : </label>
					<input type="password" name="cnfPass" class="form-control" id="tCnfPass" placeholder="re-enter your password" onBlur="validateCnfPass()" />
					<div class="text-danger text-xs-center small"><span id="pCnfPass"></span></div>
				</div>

				<div>
					<label for="tFName">First Name<sup class="text-danger">*</sup> : </label>
					<input type="text" name="fName" class="form-control" id="tFName" placeholder="not more than 20 characters" onBlur="validateName('f')" />
					<div class="text-danger text-xs-center small"><span id="pFName"></span></div>
				</div>

				<div>
					<label for="tLName">Last Name<sup class="text-danger">*</sup> : </label>
					<input type="text" name="lName" class="form-control" id="tLName" placeholder="not more than 20 characters" onBlur="validateName('l')" />
					<div class="text-danger text-xs-center small"><span id="pLName"></span></div>
				</div>

				<div>
					<label for="tMobile">Mobile No.<sup class="text-danger">*</sup> : </label>
					<input type="text" name="mobile" class="form-control" id="tMobile" placeholder="10 digit number" onBlur="validateMobile()" />
					<div class="text-danger text-xs-center small"><span id="pMobile"></span></div>
				</div>

				<p class="text-xs-center small">All the fields marked with <sup class="text-danger">*</sup> are mandatory.</p>

				<div>
					<input type="button" name="formSubmit" class="btn btn-info col-xs-4 col-xs-offset-1" id="btnSubmit" value="Register" onClick="register()" />
					<input type="reset" name="formReset" class="btn btn-info col-xs-4 col-xs-offset-2" id="btnReset" value="Reset" />
				</div>
			</fieldset>
		</form>

		<br />
		<br class="clearFloat" />
		<cfinclude template="_Footer.cfm">
	</body>
</html>
