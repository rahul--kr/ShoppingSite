/*
=======================================================================
 File Name	: LoginAction.cfc
 Description: Action page for Login page view
 Created By	: Rahul Kumar
 Created	: 21 Aug 2016
=======================================================================
*/

component displayName="LoginAction" hint="action page for Login page view" accessors=true output=false persistent=false {

	public function init() {

	}

	// get useres logged in to the site
	remote function login( string uName, string pass ) {
		// validate user input data for correct format
		Local.errorMessage = Request.validationObject.validateLoginForm( Arguments );
		// check if the username and password user entered matches
		if( Local.errorMessage == "" ) {
			Local.errorMessage = Request.dBOperationsObject.authUserLogin( Arguments );
		}
		// return error message if any error is found or return success if successfully logged in
		if( Local.errorMessage != "" ) {
			return Local.errorMessage;
		}
		// rotate session and set session variables after user is successfully authenticated
		sessionRotate();
		Session.userName = Arguments.uName;
		Session.userId = Request.dBOperationsObject.getUidFromUname( Session.userName );
		return "Success";
	}
}
