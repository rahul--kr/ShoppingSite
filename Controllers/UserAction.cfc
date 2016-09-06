/*
=======================================================================
 File Name	: UserAction.cfc
 Description: Action page for various user related operations.
 Created By	: Rahul Kumar
 Created	: 05 Sep 2016
=======================================================================
*/

component accessors=true output=false persistent=false {

	public function getUserInfo() {
		try {
			Local.userInfo = Request.dBOperationsObject.getUserInfo();
		}
		catch( any exception ) {
			// log error and redirect to error page
		}
		return Local.userInfo;
	}

	public function getOrderList() {
		try {
			Local.orders = Request.dBOperationsObject.getOrders();
		}
		catch( any exception ) {
			// log error and redirect to error page
		}
		return Local.orders;
	}
}