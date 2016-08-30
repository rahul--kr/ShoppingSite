/*
=======================================================================
 File Name	: RegistrationOperations.js
 Description: Contains client side validations for the form fields and later an AJAX call to register user.
 Created By	: Rahul Kumar
 Created	: 21 Aug 2016
=======================================================================
*/

// method to validate email address
function validateEMail() {
	var message = "";
	var eMail = document.getElementById("tEMail").value;
	document.getElementById("tEMail").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( eMail ) : message;
	message = message == "" ? isLTMaxlength( eMail, 50 ) : message;
	if( message == "" ) {
		if( eMail.search(/^[a-z][\w\.]*@[a-z]\w+(\.[a-z]{2,3}){1,2}$/) < 0 ) {
			message = "Please enter a valid email address.";
		}
	}
	document.getElementById("pEMail").innerHTML = message;
	return styleInput("tEMail", message);
}

// method to check if both passwords match
function validateCnfPass() {
	var message = "";
	var password = document.getElementById("tPass").value;
	var cnfPaswd = document.getElementById("tCnfPass").value;
	document.getElementById("tCnfPass").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( cnfPaswd ) : message;
	if( message == "" ) {
		if( password != cnfPaswd ) {
			message = "Passwords do not match.";
			isError = true;
		}
	}
	document.getElementById("pCnfPass").innerHTML = message;
	return styleInput("tCnfPass", message);
}

// method to validate name
function validateName(index) {
	switch(index) {
	case 'f':
		tField = "tFName";
		pField = "pFName";
		break;
	case 'l':
		tField = "tLName";
		pField = "pLName";
		break;
	}
	var message = "";
	var name = document.getElementById(tField).value;
	document.getElementById(tField).style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( name ) : message;	message = message == "" ? isLTMaxlength( name, 20 ) : message;
	if( message == "" ) {
		if( name.search(/^[a-zA-Z]+$/) < 0 ) {
			message = "Please enter a valid name.";
		}
	}
	document.getElementById(pField).innerHTML = message;
	return styleInput(tField, message);
}

// method to validate phone numbers
function validateMobile() {
	var message = "";
	var mobile = document.getElementById("tMobile").value;
	document.getElementById("tMobile").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( mobile ) : message;
	message = message == "" ? isLTMaxlength( mobile, 10 ) : message;
	if( message=="" ) {
		if( mobile.search(/^[1-9]\d{9}$/) < 0 ) {
			message = "Please enter a valid 10 digit phone number.";
		}
	}
	document.getElementById("pMobile").innerHTML = message;
	return styleInput("tMobile", message);
}

// method to validate the whole form at once
function validateForm(formObject, formField, fieldValue) {
	var isError = false;
	isError = validateEMail() || isError;
	isError = validateUName()|| isError;
	isError = validatePass() || isError;
	isError = validateCnfPass() || isError;
	isError = validateMobile() || isError;
	isError = validateName('f') || isError;
	isError = validateName('l') || isError;
	if( isError ) {
		return false;
	}
	registrationAction();
	return true;
}

//method to validate and submit user registration info
function registrationAction() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			if (xhttp.responseText.search(/Success/) > 0) {
				window.location = "/../Index.cfm";
			}
			else {
				window.location = "Registration.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("POST", "/../Controllers/RegistrationAction.cfc?method=register", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	var userData = getUserInput();
	xhttp.send( userData );
}

// method to get user input data from form fields to a format to pass it for AJAX call
function getUserInput() {
	var inputData = "";
	inputData += "eMail=" + document.getElementById("tEMail").value + "&uName=" + document.getElementById("tUName").value + "&pass=" + document.getElementById("tPass").value + "&cnfPass=" + document.getElementById("tCnfPass").value + "&fName=" + document.getElementById("tFName").value + "&lName=" + document.getElementById("tLName").value + "&mobile=" + document.getElementById("tMobile").value;
	return inputData;
}
