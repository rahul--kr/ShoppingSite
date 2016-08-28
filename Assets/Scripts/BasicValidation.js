/*
=======================================================================
 File Name	: BasicValidation.js
 Description: This file contains the client side methods required for validations for the form fields.
 Created By	: Rahul Kumar
 Created	: 24 Aug 2016
=======================================================================
*/

// method to validate if field is empty
function isEmpty( element ) {
	if( element.length < 1 ) {
		return "This field is required.";
	}
	return "";
}

// method to validate if element "is Greater Than Minlength"
function isGTMinlength( element, minLength ) {
	if( element.length < minLength ) {
		return "This field cannot be less than " + minLength + " characters.";
	}
	return "";
}

// method to validate if element "is Less Than Minlength"
function isLTMaxlength( element, maxLength ) {
	if( element.length > maxLength ) {
		return "This field cannot be more than " + maxLength + " characters.";
	}
	return "";
}

// method to style input borders
function styleInput( element, message ) {
	if( message != "" ) {
		document.getElementById(element).style.border = "1px solid #ff0000";
		return true;
	}
	else {
		document.getElementById(element).style.border = "1px solid #009900";
		return false;
	}
}
