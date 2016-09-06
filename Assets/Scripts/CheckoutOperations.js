/*
=======================================================================
 File Name	: CheckoutOperations.js
 Description: The file to handle operations at the checkout page.
 Created By	: Rahul Kumar
 Created	: 31 Aug 2016
=======================================================================
*/

// adds order details, product quantities to DB and return to payment page 
function checkout( userShippingId ) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			if (xhttp.responseText.search(/Success/) > 0) {
				window.location = "Payment.cfm";
			}
			else {
				window.location = "Error.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("GET", "/../Controllers/CheckoutAction.cfc?method=checkout&userShippingId="+userShippingId, true);
	xhttp.send();
}

//method to validate address line
function validateAddrLine( index ) {
	switch( index ) {
	case 1:
		tField = "tHouseNo";
		pField = "pHouseNo";
		break;
	case 2:
		tField = "tStreet";
		pField = "pStreet";
		break;
	}
	var message = "";
	var addrLine = document.getElementById(tField).value;
	document.getElementById(tField).style.border = "1px solid #0000ff";
	if( index!=3 ) {
		message = message == "" ? isEmpty( addrLine ) : message;
	}
	message = message == "" ? isLTMaxlength( addrLine, 50 ) : message;
	document.getElementById(pField).innerHTML = message;
	return styleInput(tField, message);
}

// method to validate city
function validateCity() {
	var message = "";
	var city = document.getElementById("tCity").value;
	document.getElementById("tCity").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( city ) : message;
	message = message == "" ? isLTMaxlength( city, 50 ) : message;
	if( message == "" ) {
		if( city.search(/^[a-zA-Z]+[\s[a-zA-Z]+]*$/) < 0 ) {
			message = "Please enter a valid city name.";
		}
	}
	document.getElementById("pCity").innerHTML = message;
	return styleInput("tCity", message);
}

// method to validate PIN code
function validatePin() {
	var message = "";
	var pin = document.getElementById("tPostalCode").value;
	message = message == "" ? isEmpty( pin ) : message;
	message = message == "" ? isLTMaxlength( pin, 10 ) : message;
	document.getElementById("tPostalCode").style.border = "1px solid #0000ff";
	if( message=="" ) {
		if( pin.search(/^[A-Za-z]*\d+$/) < 0 ) {
			message = "Please enter a valid PIN code.";
		}
	}
	document.getElementById("pPostalCode").innerHTML = message;
	return styleInput("tPostalCode", message);
}

// method to validate state
function validateState() {
	var message = "";
	var state = document.getElementById("tState").value;
	document.getElementById("tState").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( state ) : message;
	message = message == "" ? isLTMaxlength( state, 50 ) : message;
	if( message=="" ) {
		if( state.search(/^[a-zA-Z]+[\s[a-zA-Z]+]*$/) < 0 ) {
			message = "Please enter a valid state name.";
		}
	}
	document.getElementById("pState").innerHTML = message;
	return styleInput("tState", message);
}

// method to validate country
function validateCountry() {
	var message = "";
	var country = document.getElementById("tCountry").value;
	document.getElementById("tCountry").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( country ) : message;
	message = message == "" ? isLTMaxlength( country, 50 ) : message;
	if( message=="" ) {
		if( country.search(/^[a-zA-Z]+[\s[a-zA-Z]+]*$/) < 0 ) {
			message = "Please enter a valid country name.";
		}
	}
	document.getElementById("pCountry").innerHTML = message;
	return styleInput("tCountry", message);
}

// method to add new address corresponding to the user and adding the order details
function addAddrCheckout() {
	var isError = false;
	isError = validateAddrLine(1) || isError;
	isError = validateAddrLine(2)|| isError;
	isError = validatePin() || isError;
	isError = validateState() || isError;
	isError = validateCountry() || isError;
	if( isError ) {
		return false;
	}
	addAddress();
	return true;
}

//method to validate and submit user registration info
function addAddress() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			if (xhttp.responseText.search(/Success/) > 0) {
				window.location = "Payment.cfm";
			}
			else {
				window.location = "Checkout.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("POST", "/../Controllers/CheckoutAction.cfc?method=addAddrCheckout", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	var userAddress = getAddressInput();
	xhttp.send( userAddress );
}

// method to get user input data from form fields to a format to pass it for AJAX call
function getAddressInput() {
	var inputData = "";
	inputData += "houseNo=" + document.getElementById("tHouseNo").value + "&street=" + document.getElementById("tStreet").value + "&pCode=" + document.getElementById("tPostalCode").value + "&city=" + document.getElementById("tCity").value + "&state=" + document.getElementById("tState").value + "&country=" + document.getElementById("tCountry").value;
	return inputData;
}
