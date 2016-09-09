/*
=======================================================================
 File Name	: SendMail.cfc
 Description: CF component that handles email sending function.
 Created By	: Rahul Kumar
 Created	: 21 Aug 2016
=======================================================================
*/

component displayName="SendMail" hint="CF component that handles email sending function." accessors=true output=false persistent=false {

	public function init() {

	}

	// method to send mail to users
	public string function sendMail( string mailTo, string mailFrom, string subject, string body ) output="false" hint="sends emails" {
		try {
			// create mailer service
			mailerService = new mail();
			if( Arguments.mailTo NEQ "" AND Arguments.mailFrom NEQ "" AND Arguments.subject NEQ "" ) {
				savecontent variable="mailBody" {
					WriteOutput("This message was sent by an automatic mailer built with cfmail:= = = = = = = = = = = = = = = = = = = = = = = = = = =" & "<br><br>" & Arguments.body);
				}

				/* set mail attributes using implicit setters provided */
				mailerService.setTo( Arguments.mailTo );
				mailerService.setFrom( Arguments.mailFrom );
				mailerService.setSubject( Arguments.subject );
				mailerService.setType("html");

				// send mail using send(). Attribute values specified in an end action like "send" will not persist after the action is performed
				mailerService.send(body=mailBody);
			}
		}
		catch( any exception ) {
			return exception.message;
		}
		return "";
	}
}
