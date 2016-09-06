/*
=======================================================================
 File Name	: Application.cfc
 Description: Application file with CF component for application wide usage.
 Created By	: Rahul Kumar
 Created	: 17 Aug 2016
=======================================================================
*/

component displayname="Application" hint="handle the application" accessors=true output=true persistent=false {

	public function init() {

	}

	this.applicationTimeout = Createtimespan(0, 0, 05, 10);
	this.clientManagement = true;
	this.clientStorage = "cookie";
	this.loginStorage = "cookie";
	this.name = "Shopping Site";
	this.scriptProtect = "all";
	this.sessionType="j2ee";
	this.sessionManagement = true;
	this.sessionTimeout = Createtimespan(0, 0, 05, 0);
	this.setClientCookies = true;
	this.setDomainCookies =false;
	this.dataSource = "ShoppingSiteDSN";
	this.mappings["/Root"] = getDirectoryFromPath(getCurrentTemplatePath());
	Application.fromEmail = "rahul.k@mindfiresolutions.com";

	// The application first starts: the first request for a page is processed or the first CFC method is invoked by an event gateway instance, or a web services or Flash Remoting CFC.
	function onApplicationStart() {
		WriteLog( text="Application started successfully.", type="Information", file="logDemoApplication" );
		// query the DB to get categories and store it in an Application scope variable ( would be needing it everywhere )
		Local.spService = new storedProc(); // create a new storedproc service
		Local.spService.setProcedure( "CategoryGet" ); // set attributes using implicit setters
		Local.spService.addProcResult( name="rs1", resultset=1 ); // add procresults using addProcResult
		Local.result = Local.spService.execute(); // execute the stored procedure
		Application.categoryList = Local.result.getProcResultSets().rs1; // getProcResultSets() returns resultsets added using addProcresult()
	}

	// A session starts.
	function onSessionStart() {
		WriteLog(text="Session started successfully.", type="Information", file="logDemoApplication");
		Session.cart = StructNew();
		Session.totalQty = 0;
	}

	// A request starts.
	function onRequestStart(string targetPage) {
		Request.loginActionObject = createObject("component", "Controllers.LoginAction" );
		Request.registrationActionObject = createObject("component", "Controllers.RegistrationAction" );
		Request.dBOperationsObject = createObject("component", "Models.DBOperations" );
		Request.sendMailObject = createObject("component", "Models.SendMail" );
		Request.validationObject = createObject("component", "Models.Validation" );
		Request.categoryActionObject = createObject("component", "Controllers.CategoryAction" );
		Request.productActionObject = createObject("component", "Controllers.ProductAction" );
		Request.cartActionObject = createObject("component", "Controllers.CartAction" );
		Request.checkoutActionObject = createObject("component", "Controllers.CheckoutAction");
		Request.userActionObject = createObject("component", "Controllers.UserAction");
		WriteLog(text="Request started successfully.", type="Information", file="logDemoApplication");
		return true;
	}

	// The onRequestStart method finishes. This method can filter request contents.
	function onRequest(string targetPage) {
		include Arguments.targetPage;
	}

	// ColdFusion received a request for a non-existent page
	function onMissingTemplate(string targetPage) {
		WriteLog(text="A requested page #Arguments.targetPage# was unavailable", type="Error", file="logDemoError");
	}

	// Handles missing method exceptions
	function onMissingMethod(string method, struct args) {
		WriteLog(text="A requested method #Arguments.method# was unavailable", type="Error", file="logDemoError");
	}

/*
	// HTTP or AMF calls are made to an application
	function onCFCRequest(string cfcName, string method, struct args) {
		Request.object = createObject( "component", Arguments.cfcName );
		return invoke(object, method, args);
	}
*/

/*
	// An exception that is not caught by a try/catch block occurs
	function onError(exception, eventName) {
		WriteLog(text="An unhandled exception was caught.", type="Error", file="logDemoError");
		WriteLog(text="[#Arguments.eventName#]: #Arguments.exception#", type="Error", file="logDemoError");
	}
*/

	// All pages in the request have been processed
	function onRequestEnd(string targetPage) {
		WriteLog(text="Request ended successfully.", type="Information", file="logDemoApplication");
	}

	// A session ends
	function onSessionEnd(sessionScope, applicationScope) {
		WriteLog(text="Session ended successfully.", type="Information", file="logDemoApplication");
		if( !structIsEmpty( Session.cart )) {
			Local.cart = "";
			Local.product = structKeyArray( Session.cart );
			Local.number = structCount( Session.cart );
			for( Local.i=1; Local.i<=Local.number; Local.i++ ) {
				Local.cart = Local.cart & toString( Local.product[Local.i] ) & '=' & toString( structFind( Session.cart, Local.product[Local.i] ) );
				structDelete( Session.cart, Local.product[Local.i] );
			}
			Cookie.cart = {
				value = Local.cart,
				expires = "never",
				secure = "true"
			};
		}
	}

	// The application ends: the application times out, or the server is stopped
	function onApplicationEnd(applicationScope) {
		WriteLog(text="Application ended successfully.", type="Information", file="logDemoApplication");
	}
}
