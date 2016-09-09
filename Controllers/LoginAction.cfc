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
		try {
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
			Request.dBOperationsObject.getUidFromUname( Session.userName );
			for( key in Session.cart ) {
				Request.dBOperationsObject.addToCartDB( key, Session.cart[key] );
			}
			structClear( Session.cart );
			Session.totalQty = 0;
			Local.cart = Request.dBOperationsObject.getCart();
			Local.cartNum = Local.cart.recordCount;
			for( item in Local.cart ) {
				structInsert( Session.cart, item.ProductId, item.Quantity );
				Session.totalQty += item.Quantity;
			}
		}
		catch( any exception ) {
			// log error and redirect to error page
		}
		return "Success";
	}

	remote function logout() {
		try {
			structClear( Cookie );
			structClear( Session );
			return "Success";
		}
		catch( any exception ) {
			return exception.message;
		}
	}
}
