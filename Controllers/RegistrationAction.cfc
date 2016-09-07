/*
=======================================================================
 File Name	: RegistrationAction.cfc
 Description: Action page for Registration page view
 Created By	: Rahul Kumar
 Created	: 21 Aug 2016
=======================================================================
*/

component displayName="RegistrationAction" hint="Action page for Registration page view" accessors=true output=false persistent=false {

	public function init() {

	}

	// get user registered to access the site
	remote String function register( string eMail, string uName, string pass, string cnfPass, string fName, string lName, string mobile ) {
		try {
			// validate user input data for correct format
			Local.errorMessage = Request.validationObject.validateRegForm( Arguments );

			// check for unique data( email, username, mobile )
			if( Local.errorMessage == "" ) {
				Local.errorMessage = Request.dBOperationsObject.checkUnique( Arguments.eMail, Arguments.uName, Arguments.mobile );
			}
			// insert user registration data into DB
			if( Local.errorMessage == "" ) {
				Local.errorMessage = Request.dBOperationsObject.insertIntoDB( Arguments );
			}
/*
			// send email to the registered email address
			if( Local.errorMessage == "" ) {
				Local.errorMessage = Request.sendMailObject.sendMail( Arguments.eMail, Application.fromEmail, "You are successfully registered.", "Kindly login to continue." );
			}
*/
			// return error message if any error is found or return success if successfully registered
			if( Local.errorMessage != "" ) {
				return Local.errorMessage;
			}
			// rotate session and set session variables after user is successfully authenticated
			sessionRotate();
			Session.userName = Arguments.uName;
			Request.dBOperationsObject.getUidFromUname( Session.userName );
			for( key in Session.cart ) {
				Request.dBOperationsObject.addToCartDB( key, Session.cart[key] );
			}
		}
		catch( any exception ) {
			// log error and redirect to error page
		}
		return "Success";
 	}
}
