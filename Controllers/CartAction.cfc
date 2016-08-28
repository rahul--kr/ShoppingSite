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
	remote function addToCart( string pId ) {
		try {
			structInsert( Session.cart, Arguments.pId, 1 );
			return "Success";
		}
		catch( any exception ) {
			return Arguments.exception.message;
		}
	}

	// method that gets details of products stored in user's cart
	remote array function getCartDetails( struct cart ) {
		try {
			Local.details = arrayNew(1);
			Local.cartArray = StructKeyArray( Session.cart );
			Local.pCount = StructCount( Session.cart );
			for( Local.i=1; Local.i<=Local.pCount; Local.i++ ) {
				Local.details[Local.i] = Request.dBOperationsObject.getProductData( Local.cartArray[i] );
			}
			return Local.details;
		}
		catch( any exception ) {
			//
		}
	}

	remote string function decreaseQuantity( string pId ) {
		try {
			Local.newQty = structFind( Session.cart, Arguments.pId );
			Local.newQty = Local.newQty - 1;
			structDelete( Session.cart, Arguments.pId );
			if( Local.newQty > 0 )
				structInsert( Session.cart, Arguments.pId, Local.newQty );
		}
		catch( any exception ) {
			return Arguments.exception.message;
		}
		return "Success" & toString( Local.newQty ) & "\\";
	}

	remote string function increaseQuantity( string pId, string stock ) {
		try {
			Local.newQty = structFind( Session.cart, Arguments.pId );
			Local.newQty = Local.newQty + 1;
			if( Local.newQty > Arguments.stock )
				Local.newQty = Local.newQty - 1;
			structDelete( Session.cart, Arguments.pId );
			structInsert( Session.cart, Arguments.pId, Local.newQty );
		}
		catch( any exception ) {
			return Arguments.exception.message;
		}
		return "Success" & toString( Local.newQty ) & "\\";
	}
}