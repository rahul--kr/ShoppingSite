/*
=======================================================================
 File Name	: CartAction.cfc
 Description: Action page for operations to perform on cart.
 Created By	: Rahul Kumar
 Created	: 25 Aug 2016
=======================================================================
*/

component displayName="CartAction" hint="handles cart operations" accessors=true output=false persistent=false {

	public function init() {

	}

	// method to add product to cart
	remote function addToCart( string pId, string stock ) {
		try {
			Local.retMessage = "";
			if( structKeyExists( Session.cart, pId ) ) {
				Local.retMessage = increaseQuantity( Arguments.pId, Arguments.stock );
			}
			else {
				structInsert( Session.cart, Arguments.pId, 1 );
				Session.totalQty++;
				Local.retMessage = "Success";
				if( isDefined( "Session.userId" ) ) {
					Request.dBOperationsObject.addToCartDB( Arguments.pId, structFind( Session.cart, Arguments.pId ) );
				}
			}
		}
		catch( any exception ) {
			// log exception
			return exception.message;
		}
		return Local.retMessage;
	}

	// method that gets details of products stored in user's cart
	remote array function getCartDetails( struct cart ) {
		try {
			Local.details = arrayNew(1);
			Local.cartArray = structKeyArray( Session.cart );
			Local.pCount = structCount( Session.cart );
			for( Local.i=1; Local.i<=Local.pCount; Local.i++ ) {
				Local.details[Local.i] = Request.dBOperationsObject.getProductData( Local.cartArray[Local.i] );
			}
			return Local.details;
		}
		catch( any exception ) {
			//
		}
	}

	remote string function decreaseQuantity( string pId ) {
		try {
			Local.quantity = structFind( Session.cart, Arguments.pId );
			Local.newQty = Local.quantity - 1;
			Session.totalQty--;
			structDelete( Session.cart, Arguments.pId );
			if( Local.newQty > 0 ) {
				structInsert( Session.cart, Arguments.pId, Local.newQty );
			}
			if( isDefined( "Session.userId" ) ) {
				Request.dBOperationsObject.addToCartDB( Arguments.pId, Local.newQty );
			}
		}
		catch( any exception ) {
			return exception.message;
		}
		return "Success" & toString( Local.newQty ) & "\\";
	}

	remote string function increaseQuantity( string pId, string stock ) {
		try {
			Local.incremented = "n"; // "n" for no; "y" for yes: to keep track if the value was incremented
			Local.newQty = structFind( Session.cart, Arguments.pId );
			if( Local.newQty < Arguments.stock ) {
				Local.newQty = Local.newQty + 1;
				Local.incremented = "y";
				Session.totalQty++;
				structDelete( Session.cart, Arguments.pId );
				structInsert( Session.cart, Arguments.pId, Local.newQty );
				if( isDefined( "Session.userId" ) ) {
					Request.dBOperationsObject.addToCartDB( Arguments.pId, structFind( Session.cart, Arguments.pId ) );
				}
			}
		}
		catch( any exception ) {
			return exception.message;
		}
		return Local.incremented & "Success" & toString( Local.newQty ) & "\\";
	}
}
