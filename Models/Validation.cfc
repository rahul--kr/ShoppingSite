/*
=======================================================================
 File Name	: Validation.cfc
 Description: CFC file for validating user inputs on server side.
 Created By	: Rahul Kumar
 Created	: 21 Aug 2016
=======================================================================
*/

component displayName="Validation" hint="CFC file for validating user inputs" accessors=true output=false persistent=false {

	public function init() {
		Variables.errorMessage = "";
	}

	package function validateEMail(string eMail) hint="method to validate email address" output="false" {
		if( Arguments.eMail == "" )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Email field is required.", '\');
		else if( Len(Arguments.eMail) GT 50 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The email cannot be more than 50 characters.", '\');
		else if( REFind('^[a-z][\w\.]*@[a-z]\w+(\.[a-z]{2,3}){1,2}$', Arguments.eMail) EQ 0 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Please enter a valid email address.", '\');
	}

	package function validateUName( string uName ) hint="method to validate the username input" output="false" {
		if( Arguments.uName EQ "" )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "User name Field is required.", '\');
		else if( Len(Arguments.uName) LT 6 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The username cannot be less than 6 characters.", '\');
		else if( Len(Arguments.uName) GT 15 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The username cannot be more than 15 characters.", '\');
		else if( REFind('^[\w]+$', Arguments.uName) EQ 0 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Please enter only letters from English alphabet or decimal digits or underscore.", '\');
	}

	package function validatePass( string pass ) hint="method to validate password" output="false" {
		if( Arguments.pass EQ "" )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Password field is required.", '\');
		else if( Len(Arguments.pass) LT 8 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The password cannot be less than 8 characters.", '\');
		else  if( Len(Arguments.pass) GT 15 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The password cannot be more than 15 characters.", '\');
		else if( Find( " ", Arguments.pass ) NEQ 0 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The password cannot contain blank spaces.", '\');
		else  if( REFind('^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$', Arguments.pass) EQ 0 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The password must include at least one upper case letter, one lower case letter and one numeric digit.", '\');
	}

	package function validateCnfPass( string pass, string cnfPass ) hint="method to check if both passwords match" output="false" {
		if( Arguments.cnfPass EQ "" )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Confirm password field is required.", '\');
		else  if( Arguments.pass NEQ Arguments.cnfPass )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Passwords do not match.", '\');
	}

	package function validateFName( string fName) hint="method to validate user's first name" output="false" {
		if( Arguments.fName EQ "" )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "First name field is required.", '\');
		else  if( Len(Arguments.fName) GT 20 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The first name cannot be more than 20 characters.", '\');
		else  if( REFind('^[a-zA-Z]+$', Arguments.fName) EQ 0 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Please enter a valid first name.", '\');
	}

	package function validateLName( string lName ) hint="method to validate user's last name" output="false" {
		if( Arguments.lName EQ "" )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Last name field is required.", '\');
		else  if( Len(Arguments.lName) GT 20 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "The last name cannot be more than 20 characters.", '\');
		else  if( REFind('^[a-zA-Z]+$', Arguments.lName) EQ 0 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Please enter a valid last name.", '\');
	}

	package function validateMobile( string mobile ) hint="method to validate phone numbers" output="false" {
		if( Arguments.mobile EQ "" )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Mobile no. field is required.", '\');
		else  if( REFind('^[1-9]\d{9}$', Arguments.mobile) EQ 0 )
			Variables.errorMessage = ListAppend(Variables.errorMessage, "Please enter a valid 10 digit phone number.", '\');
	}

	// validate the whole registration form at once for correct format
	public String function validateForm(struct userData) hint="method to validate the whole form at once" output="false" {
		Variables.errorMessage = "";
		validateEMail( Arguments.userData.eMail );
		validateUName( Arguments.userData.uName );
		validatePass( Arguments.userData.pass );
		validateCnfPass( Arguments.userData.pass, Arguments.userData.cnfPass );
		validateFName( Arguments.userData.fName );
		validateLName( Arguments.userData.lName );
		validateMobile( Arguments.userData.mobile );
		return Variables.errorMessage;
	}

	// validate the whole login form at once( username and password ) for correct format
	public String function validateLoginForm( struct userData) hint="method to validate the whole login form at once" output="false" {
		Variables.errorMessage = "";
		validateUName( Arguments.userData.uName );
		validatePass( Arguments.userData.pass );
		return Variables.errorMessage;
	}
}
