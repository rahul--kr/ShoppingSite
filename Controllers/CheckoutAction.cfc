/*
=======================================================================
 File Name	: CheckoutAction.cfc
 Description: Action page for checkout page view.
 Created By	: Rahul Kumar
 Created	: 30 Aug 2016
=======================================================================
*/

component accessors=true output=false persistent=false {

	// method to get all the addresses of the logged in user
	public function getAddresses() {
		return Request.dBOperationsObject.getAddresses( Session.userId );
	}

	// method to add order details to DB and empty the cart
	remote function checkout( string userShippingId ) {
		try {
			Local.orderId = Request.dBOperationsObject.addOrder( Arguments.userShippingId ).orderId;
			if( ! structIsEmpty( Session.cart ) ) {
				Local.cartArray = structKeyArray( Session.cart );
				Local.pCount = structCount( Session.cart );
				for( local.i=1; Local.i<=Local.pCount; Local.i++ ) {
					Variables.errorMessage = Request.dBOperationsObject.addOrderProducts( Local.orderId, Local.cartArray[Local.i], structFind( Session.cart, toString(Local.cartArray[Local.i]) ) );
					Request.dBOperationsObject.addToCartDB( Local.cartArray[Local.i], "0" );
					structDelete( Session.cart, Local.cartArray[Local.i] );
				}
				Session.totalQty = 0;
			}
		}
		catch( any exception ) {
			// log error and redirect to error page
			return exception;
		}
		return "Success";
	}

	// method to validate address field and add it to DB for the user and add order ans shipping details
	remote function addAddrCheckout( string houseNo, string street, string pCode, string city, string state, string country ) {
		// validate user input address data for correct format
		Local.errorMessage = Request.validationObject.validateAddress( Arguments );
		if( Local.errorMessage != "" ) {
			return Local.errorMessage;
		}

		// insert user address into DB
		try {
			Local.orderId = Request.dBOperationsObject.insertAddrOrder( Arguments ).orderId;
			if( ! structIsEmpty( Session.cart ) ) {
				Local.cartArray = structKeyArray( Session.cart );
				Local.pCount = structCount( Session.cart );
				for( local.i=1; Local.i<=Local.pCount; Local.i++ ) {
					Variables.errorMessage = Request.dBOperationsObject.addOrderProducts( Local.orderId, Local.cartArray[Local.i], structFind( Session.cart, toString(Local.cartArray[Local.i]) ) );
					structDelete( Session.cart, Local.cartArray[Local.i] );
				}
			}
		}
		catch( any exception ) {
			// log error and redirect to error page
			return exception;
		}
		return "Success";
	}
}
