/*
=======================================================================
 File Name	: AddToCart.cfc
 Description: The file to handle operations after a user tries to add a product to cart.
 Created By	: Rahul Kumar
 Created	: 25 Aug 2016
=======================================================================
*/

// method to add a product to cart with given product id 
function addToCart( productId ) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			if (xhttp.responseText.search(/Success/) > 0) {
				location.reload();
			}
			else {
				window.location = "Error.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("GET", "/../Controllers/CartAction.cfc?method=addToCart&pId="+productId, true);
	xhttp.send();
}

// method to extract quantity returned after incrementing or decrementing product quantity in cart
function getQty( response ) {
	var qtyStart = response.indexOf( "Success" );
	var qtyEnd = response.indexOf( "\\" );
	return response.substring( qtyStart+7, qtyEnd );
}

// method to decrement the quantity of a product in cart by 1
function decreaseQuantity( productId, costPerItem ) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if ( xhttp.readyState == 4 && xhttp.status == 200 ) {
			if ( xhttp.responseText.search(/Success/) > 0 ) {
				var qty = getQty( xhttp.responseText );
				if( qty == "0" )
					location.reload();
				document.getElementById( "prodQty"+productId ).innerHTML = qty;
				document.getElementById( "prodSubtotal"+productId ).innerHTML = costPerItem * qty;
				document.getElementById( "gTotal" ).innerHTML = parseInt( document.getElementById( "gTotal" ).innerHTML ) - parseInt( costPerItem );
			}
			else {
				window.location = "Error.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open( "GET", "/../Controllers/CartAction.cfc?method=decreaseQuantity&pId="+productId, true );
	xhttp.send();
}

//method to increment the quantity of a product in cart by 1
function increaseQuantity( productId, costPerItem, unitsInStock ) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if ( xhttp.readyState == 4 && xhttp.status == 200 ) {
			if ( xhttp.responseText.search( /Success/ ) > 0 ) {
				var qty = getQty( xhttp.responseText );
				document.getElementById( "prodQty"+productId ).innerHTML = qty;
				document.getElementById( "prodSubtotal"+productId ).innerHTML = costPerItem * qty;
				if( xhttp.responseText[ xhttp.responseText.indexOf("Success") - 1] == 'y' )
					document.getElementById( "gTotal" ).innerHTML = parseInt( document.getElementById( "gTotal" ).innerHTML ) + parseInt( costPerItem );
			}
			else {
				window.location = "Error.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open( "POST", "/../Controllers/CartAction.cfc?method=increaseQuantity", true );
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send( "pId=" + productId + "&stock=" + unitsInStock );
}
