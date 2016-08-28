/*
=======================================================================
 File Name	: DBOperations.cfc
 Description: CF component that handles DB operations.
 Created By	: Rahul Kumar
 Created	: 21 Aug 2016
=======================================================================
*/

component displayname="DBOperations" hint="CF component that handles and executes DB operations." accessors=true output=false persistent=false {

	public function init() {

	}

	// method to check if the email, username and mobile number user entered is unique
	public String function checkUnique( string eMail, string uName, string mobile ) {
		Local.queryService = new query();
		Local.queryService.setName("queryUnique");

		try {
			// query the DB and get count of rows returned
			Local.queryService.addParam(name="eMail", value=Arguments.eMail, cfsqltype="cf_sql_varchar");
			Local.queryEMail = queryService.execute(sql="SELECT
				EmailId
				FROM UserDetail
				WHERE EmailId=:eMail").getPrefix();
			if( Local.queryEMail.RecordCount >= 1 ) {
				return "The email " & Arguments.eMail & " is already registered with us.";
			}

			Local.queryService.addParam(name="uName", value=Arguments.uName, cfsqltype="cf_sql_varchar");
			Local.queryUName = queryService.execute(sql="SELECT
				UserName
				FROM UserDetail
				WHERE UserName=:uName").getPrefix();
			if( Local.queryUName.RecordCount >= 1 ) {
				return "The user name " & Arguments.uName & " is already registered with us.";
			}

			Local.queryService.addParam(name="mobile", value=Arguments.mobile, cfsqltype="cf_sql_varchar");
			Local.queryMobile = queryService.execute(sql="SELECT
				MobileNo
				FROM UserDetail
				WHERE MobileNo=:mobile").getPrefix();
			if( Local.queryMobile.RecordCount >= 1 ) {
				return "The mobile number " & Arguments.mobile & " is already registered with us.";
			}
		}
		catch( any exception ) {
			return Arguments.exception.message;
		}
		return "";
	}

	// method to insert user registration data into DB
	public String function insertIntoDB( struct userData ) hint="insert registration data into DB" output="false" {
		Local.salt = Hash( GenerateSecretKey("AES"), "SHA-512" );
		Local.hashPass = Hash( Arguments.userData.pass & Local.salt, "SHA-512" );

		Local.queryService = new query();
		queryService.setName("registerUser");

		try {
			Local.queryService.addParam(name="eMail", value=Arguments.userData.eMail, cfsqltype="cf_sql_varchar");
			Local.queryService.addParam(name="uName", value=Arguments.userData.uName, cfsqltype="cf_sql_varchar");
			Local.queryService.addParam(name="hPass", value=Local.hashPass, cfsqltype="cf_sql_char");
			Local.queryService.addParam(name="salt", value=Local.salt, cfsqltype="cf_sql_char");
			Local.queryService.addParam(name="fName", value=Arguments.userData.fName, cfsqltype="cf_sql_varchar");
			Local.queryService.addParam(name="lName", value=Arguments.userData.lName, cfsqltype="cf_sql_varchar");
			Local.queryService.addParam(name="mobile", value=Arguments.userData.mobile, cfsqltype="cf_sql_bigint");

			Local.queryService.execute(sql="INSERT INTO UserDetail (
				EmailId, UserName, Password, Salt,
				FirstName, LastName, MobileNo )
				VALUES (
				:eMail, :uName, :hPass, :salt,
				:fName, :lName, :mobile	)");
		}
		catch( any exception ) {
			return Arguments.exception.message;
		}
		return "";
	}

	// check if user has entered a valid username and password
	public String function authUserLogin( struct userData ) hint="insert registration data into DB" output="false" {
		Local.queryService = new query();
		Local.queryService.setName("queryUser");

		try {
			Local.queryService.addParam(name="uName", value=Arguments.userData.uName, cfsqltype="cf_sql_varchar");
			Local.queryService.addParam(name="pass", value=Arguments.userData.pass, cfsqltype="cf_sql_varchar");

			Variables.queryUserData = queryService.execute(sql="SELECT
				UserId, UserName, Password, Salt
				FROM UserDetail
				WHERE UserName=:uName").getResult();

			Local.hashedPass = Hash( Arguments.userData.pass & Variables.queryUserData.Salt, "SHA-512");
			if( Local.hashedPass != Variables.queryUserData.Password ) {
				return "The username or password is incorrect.";
			}
		}
		catch( any exception ) {
			return Arguments.exception.message;
		}
		return "";
	}

	// get the list of products according to the category
	public function getProductList( string cat ) {
		try {
			Local.spService = new storedProc();
			Local.spService.setProcedure( "ProductGet" );
			Local.spService.addParam( cfsqltype="cf_sql_smallint", type="in", value=Arguments.cat );
//			Local.spService.addParam( cfsqltype="cf_sql_smallint", type="in", value=Arguments.pageNo);
			Local.spService.addProcResult( name="rs1", resultset=1 );
			Local.result = Local.spService.execute();
			Local.productList = Local.result.getProcResultSets().rs1;
		}
		catch( any exception ) {
			// log error and redirect to error page
		}
		return Local.productList;
	}

	// get the data of a product according to product id
	public function getProductData( string pId ) {
		try {
			Local.spService = new storedProc();
			Local.spService.setProcedure( "ProductDataGet" );
			Local.spService.addParam( cfsqltype="cf_sql_smallint", type="in", value=Arguments.pId );
			Local.spService.addProcResult( name="rs1", resultset=1 );
			Local.result = Local.spService.execute();
			Local.productData = Local.result.getProcResultSets().rs1;
		}
		catch( any exception ) {
			// log error and redirect to error page
		}
		return Local.productData;
	}
}
