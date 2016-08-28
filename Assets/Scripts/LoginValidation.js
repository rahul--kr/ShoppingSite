/*
=======================================================================
 File Name	: LoginValidation.js
 Description: This file contains all the client side validations for the Login form fields.
 Created By	: Rahul Kumar
 Created	: 24 Aug 2016
=======================================================================
*/

// method to validate the username input
function validateUName() {
	var message = "";
	var uName = document.getElementById("tUName").value;
	document.getElementById("tUName").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( uName ) : message;
	message = message == "" ? isGTMinlength( uName, 6 ) : message;
	message = message == "" ? isLTMaxlength( uName, 15 ) : message;
	if( message == "" ) {
		if( uName.search(/^[\w]+$/) < 0 ) {
			message = "Please enter only letters from English alphabet or decimal digits or underscore."
		}
	}
	document.getElementById("pUName").innerHTML = message;
	return styleInput("tUName", message);
}

// method to validate password
function validatePass() {
	var message = "";
	var password = document.getElementById("tPass").value;
	document.getElementById("tPass").style.border = "1px solid #0000ff";
	message = message == "" ? isEmpty( password ) : message;
	message = message == "" ? isGTMinlength( password, 8 ) : message;
	message = message == "" ? isLTMaxlength( password, 15 ) : message;
	if( message == "" ) {
		if( password.search(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/) < 0 ) {
			message = "The password must include at least one upper case letter, one lower case letter and one numeric digit.";
		}
	}
	document.getElementById("pPass").innerHTML = message;
	return styleInput("tPass", message);
}

//method to validate the whole login form at once
function validateLoginForm(formObject, formField, fieldValue) {
	var isError = false;
	isError = validateUName()|| isError;
	isError = validatePass() || isError;
	if( isError ) {
		return false;
	}
	loginAction();
	return true;
}
