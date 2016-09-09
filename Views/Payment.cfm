<!---
=======================================================================
 File Name	: Payment.cfm
 Description: User will be prompted to choose their paymnt options and details.
 Created By	: Rahul Kumar
 Created	: 31 Aug 2016
=======================================================================
--->

<!---
<cfif isDefined( "Session.userId" ) >
	<cfset Variables.addresses = Request.checkoutActionObject.getAddresses() />
	<cfelse>
		<cflocation url="Login.cfm?errors=Please login to continue" addToken="false">
</cfif>
 --->

<! DOCTYPE HTML >
<html>
	<head>
		<title>Payment - Shopping Site</title>
	</head>
	<body>
		<div class="wrapper">
			<cfinclude template="/Views/_Header.cfm">

			<div class="bodyDist">
				<cfinclude template="/Views/_NoScript.cfm">
				<cfinclude template="/Views/_LeftMenuBar.cfm">

				<div class="col-xs-3">
					<p class="text-lg-center text-danger">You need to pay: </p>
					<label>Pay by: </label><br />
					<div class="col-xs-offset-1">
						<label for="cod">
							<input type="radio" id="cod" name="pay" value="cod" onClick="showHidePaymentOption()" checked /> Cash on Delivery<br />
						</label> <br />
						<label for="card">
							<input type="radio" id="card" name="pay" value="card" onClick="showHidePaymentOption()" /> Credit/Debit Card<br />
						</label> <br />
						<label for="net">
							<input type="radio" id="net" name="pay" value="net" onClick="showHidePaymentOption()" /> Net Banking<br />
						</label> <br />
						<label for="gift">
							<input type="radio" id="gift" name="pay" value="net" onClick="showHidePaymentOption()" /> Site Gift Card<br />
						</label> <br />
					</div>
				</div>

				<div id="cardDiv">
					<form name="cardForm" id="cardForm" class="form">
						<fieldset>
							<legend>Enter your card information: </legend>
							<div class="form-group col-xs-12">
								<div class="col-xs-12">
									<label for="tCardNo">Card Number : </label>
									<input type="text" name="cardNo" class="form-control" id="tCardNo" placeholder="16 digit card number" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-xs-7">
									<label class="col-xs-12" for="tCardMon">Expiry Date : </label>
									<div class="col-xs-5">
										<input type="text" name="cardMon" class="form-control" id="tCardMon" placeholder="MM" />
									</div>
									<div class="col-xs-5">
										<input type="text" name="cardYear" class="form-control" id="tCardYear" placeholder="YYYY" />
									</div>
								</div>

								<div class="col-xs-5">
									<div class="col-xs-12">
										<label for="tCvv">CVV Number : </label>
										<input type="password" name="cvv" class="form-control" id="tCvv" placeholder="CVV" />
									</div>
								</div>
							</div>

							<br class="clearFloat" />
							<br />
							<div>
								<input type="button" name="formSubmit" class="btn btn-info col-xs-4 col-xs-offset-1" id="btnSubmit" value="Pay" />
								<input type="reset" name="formReset" class="btn btn-info col-xs-4 col-xs-offset-2" id="btnReset" value="Reset" />
							</div>
						</fieldset>
					</form>
				</div>

				<div id="netDiv">
					<form name="netForm" id="netForm" class="form">
						<fieldset>
							<legend>Enter net banking information: </legend>

							<div class="col-xs-12 form-group">
								<label>Select your bank : </label>
								<select class="form-control">
									<option value="sbi">State Bank of India</option>
									<option value="pnb">Punjab National Bank</option>
									<option value="axis">Axis Bank</option>
									<option value="kmbl">Kotak Mahindra Bank</option>
									<option value="hdfc">HDFC Bank</option>
								</select>
							</div>

							<div class="col-xs-12 form-group">
								<label for="tUserId">Customer Id: </label>
								<input type="text" name="userId" class="form-control" id="tUserId" placeholder="customer id for bank" />
							</div>

							<div class="col-xs-12 form-group">
								<label for="tPass">Password: </label>
								<input type="password" name="pass" class="form-control" id="tPass" placeholder="password for bank login" />
							</div>
							<br class="clearFloat" />
							<div>
								<input type="button" name="formSubmit" class="btn btn-info col-xs-4 col-xs-offset-1" id="btnSubmit" value="Pay" />
								<input type="reset" name="formReset" class="btn btn-info col-xs-4 col-xs-offset-2" id="btnReset" value="Reset" />
							</div>
						</fieldset>
					</form>
				</div>

				<div id="giftDiv">
					<form name="giftForm" id="giftForm" class="form">
						<fieldset>
							<legend>Enter the gift card details: </legend>
							<div class="col-xs-12 form-group">
								<label for="tGiftNum">Gift card number: </label>
								<input type="text" name="giftNum" class="form-control" id="tGiftNum" placeholder="gift card number" />
							</div>

							<div class="col-xs-12 form-group">
								<label for="tPass">Password: </label>
								<input type="password" name="pass" class="form-control" id="tPass" placeholder="gift card password" />
							</div>
							<br class="clearFloat" />
							<div>
								<input type="button" name="formSubmit" class="btn btn-info col-xs-4 col-xs-offset-1" id="btnSubmit" value="Pay" />
								<input type="reset" name="formReset" class="btn btn-info col-xs-4 col-xs-offset-2" id="btnReset" value="Reset" />
							</div>
						</fieldset>
					</form>
				</div>

				<br class="clearFloat" />
			</div>
		</div>
		<br class="clearFloat" />
		<cfinclude template="/Views/_Footer.cfm">
		<script language="javascript" src="../Assets/Scripts/PaymentOperations.js"></script>
	</body>
</html>
