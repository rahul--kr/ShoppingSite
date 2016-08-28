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
				alert(xhttp.responseText);
				window.location = "Login.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("GET", "/../Controllers/CartAction.cfc?method=addToCart&pId="+productId, true);
	xhttp.send();
}

// method to decrement the quantity of a product in cart by 1
function decreaseQuantity( productId, unitsInStock ) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if ( xhttp.readyState == 4 && xhttp.status == 200 ) {
			if ( xhttp.responseText.search(/Success/) > 0 ) {
				var qtyStart = xhttp.responseText.indexOf( "Success" );
				var qtyEnd = xhttp.responseText.indexOf( "\\" );
				if( xhttp.responseText.substring( qtyStart+7, qtyEnd ) == "0" )
					location.reload();
				document.getElementById( "prodQty"+productId ).innerHTML = xhttp.responseText.substring( qtyStart+7, qtyEnd );
			}
			else {
				alert( xhttp.responseText );
				window.location = "Login.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open( "GET", "/../Controllers/CartAction.cfc?method=decreaseQuantity&pId="+productId, true );
	xhttp.send();
}

//method to increment the quantity of a product in cart by 1
function increaseQuantity( productId, unitsInStock ) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if ( xhttp.readyState == 4 && xhttp.status == 200 ) {
			if ( xhttp.responseText.search( /Success/ ) > 0 ) {
				var qtyStart = xhttp.responseText.indexOf( "Success" );
				var qtyEnd = xhttp.responseText.indexOf( "\\" );
				document.getElementById( "prodQty"+productId ).innerHTML = xhttp.responseText.substring( qtyStart+7, qtyEnd );
			}
			else {
				alert( xhttp.responseText );
				window.location = "Login.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open( "POST", "/../Controllers/CartAction.cfc?method=increaseQuantity", true );
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send( "pId=" + productId + "&stock=" + unitsInStock );
}


