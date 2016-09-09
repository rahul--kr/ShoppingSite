/*
=======================================================================
 File Name	: PaymentOperations.js
 Description: File has methods required for payment processing.
 Created By	: Rahul Kumar
 Created	: 09 Sep 2016
=======================================================================
*/

window.onload = showHidePaymentOption();

function showHidePaymentOption() {
	document.getElementById("cardDiv").style.display = document.getElementById("card").checked ? "block" : "none";
	document.getElementById("netDiv").style.display = document.getElementById("net").checked ? "block" : "none";
	document.getElementById("giftDiv").style.display = document.getElementById("gift").checked ? "block" : "none";
}
