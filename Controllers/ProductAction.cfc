/*
=======================================================================
 File Name	: ProductAction.cfc
 Description: Action page for product page view.
 Created By	: Rahul Kumar
 Created	: 25 Aug 2016
=======================================================================
*/

component displayName="ProductAction" hint="handles product page operations" accessors=true output=false persistent=false {

	// get the data of product according to product id
	public function getProductData( string pId ) {
		Local.productData = Request.dBOperationsObject.getProductData( Arguments.pId );
		return Local.productData;
	}
}