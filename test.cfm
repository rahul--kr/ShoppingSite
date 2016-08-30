<!---
=======================================================================
 File Name	: test.cfm
 Description: This is the template for testing purposes only.
 Created By	: Rahul Kumar
 Created	: 30 Aug 2016
=======================================================================
--->

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="Assets/StyleSheets/CustomStyles.css"/>
		<link rel="stylesheet" type="text/css" href="Assets/StyleSheets/BootstrapMin.css"/>
	</head>
	<body>
		<form name="regForm" id="loginForm" class="form">
			<fieldset>
				<legend>Login: </legend>
				<div>
					<label for="tHouseNo">House No.<sup class="text-danger">*</sup> : </label>
					<input type="text" name="houseNo" class="form-control" id="tHouseNo" autofocus />
					<div class="text-danger text-xs-center small"><span id="pHouseNo"></span></div>
				</div>

				<div>
					<label for="tStreet">Street<sup class="text-danger">*</sup> : </label>
					<input type="text" name="street" class="form-control" id="tStreet" />
					<div class="text-danger text-xs-center small"><span id="pStreet"></span></div>
				</div>

				<div>
					<label for="tPostalCode">Postal Code<sup class="text-danger">*</sup> : </label>
					<input type="text" name="postalCode" class="form-control" id="tPostalCode" />
					<div class="text-danger text-xs-center small"><span id="pPostalCode"></span></div>
				</div>

				<div>
					<label for="tCity">City<sup class="text-danger">*</sup> : </label>
					<input type="text" name="city" class="form-control" id="tCity" />
					<div class="text-danger text-xs-center small"><span id="pCity"></span></div>
				</div>

				<div>
					<label for="tState">State<sup class="text-danger">*</sup> : </label>
					<input type="text" name="state" class="form-control" id="tState" />
					<div class="text-danger text-xs-center small"><span id="pState"></span></div>
				</div>

				<div>
					<label for="tCountry">Country<sup class="text-danger">*</sup> : </label>
					<input type="text" name="country" class="form-control" id="tCountry" />
					<div class="text-danger text-xs-center small"><span id="pCountry"></span></div>
				</div>

				<p class="text-xs-center small">All the fields marked with <sup class="text-danger">*</sup> are mandatory.</p>

				<div>
					<input type="button" name="formSubmit" class="btn btn-lg col-xs-5" id="btnSubmit" value="Register" onClick="validateForm()" />
					<input type="reset" name="formSubmit" class="btn btn-lg col-xs-5" id="btnSubmit" value="Reset" />
				</div>
			</fieldset>
		</form>
	</body>
</html>
