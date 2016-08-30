/*
=======================================================================
 File Name	: CheckoutAction.cfc
 Description: Action page for checkout page view.
 Created By	: Rahul Kumar
 Created	: 30 Aug 2016
=======================================================================
*/

component accessors=true output=false persistent=false {

	public function getAddresses() {
		return Request.dBOperationsObject.getAddresses( Session.userId );
	}
}