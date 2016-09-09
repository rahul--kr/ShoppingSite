/*
=======================================================================
 File Name	: Dropdown.js
 Description: This file contains the JS code for the dropdown and logout functionality in header.
 Created By	: Rahul Kumar
 Created	: 05 Sep 2016
=======================================================================
*/

// when the user clicks on the button, toggle between hiding and showing the dropdown content
function dropDown() {
	document.getElementById("myDropdown").classList.toggle("show");
}

// close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('.dropBtn')) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

// method to logout a logged in user
function logout() {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			if (xhttp.responseText.search(/Success/) > 0) {
				window.location = "/../Index.cfm";
			}
			else {
				window.location = "Error.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("GET", "/../Controllers/LoginAction.cfc?method=logout", true);
	xhttp.send();
}

/*
// method for search functionality
function getSearchResult() {
	var searchText = document.getElementById("tSearch").value;
	alert( searchText );
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			if( xhttp.responseText.search(/Success/) > 0 ) {
				window.location = "/../Views/Category.cfm?query=1";
			}
			else {
				window.location = "Error.cfm?errors=" + xhttp.responseText;
			}
		}
	};
	xhttp.open("GET", "/../Controllers/CategoryAction.cfc?method=getSearchResult&searchText="+searchText, true);
	xhttp.send();
}
*/
