/*
=======================================================================
 File Name	: CategoryAction.cfc
 Description: Action page for category page view.
 Created By	: Rahul Kumar
 Created	: 23 Aug 2016
=======================================================================
*/

component displayName="CategoryAction" hint="handles category page actions" accessors=true output=false persistent=false {

	public function init() {
	}

	// method to get the list of products according to category id
	remote function getProductList( string cat ) {
		Local.productList = Request.dBOperationsObject.getProductList( Arguments.cat );
		return Local.productList;
	}
}
