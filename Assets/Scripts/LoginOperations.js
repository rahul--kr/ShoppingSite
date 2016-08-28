/*
=======================================================================
 File Name	: LoginOperations.js
 Description: This file makes an AJAX call to authenticate and login users.
 Created By	: Rahul Kumar
 Created	: 25 Aug 2016
=======================================================================
*/

//method to validate and submit user registration info
function loginAction() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			if (xhttp.responseText.search(/Success/) > 0) {
				window.location = "/../Index.cfm";
			}
			else {
				window.location = "Login.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("POST", "/../Controllers/LoginAction.cfc?method=login", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	var userData = getUserInput();
	xhttp.send( userData );
}

// method to get user input data from form fields to a format to pass it for AJAX call
function getUserInput() {
	var inputData = "";
	inputData += "&uName=" + document.getElementById("tUName").value + "&pass=" + document.getElementById("tPass").value;
	return inputData;
}
