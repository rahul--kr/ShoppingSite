<!--
=======================================================================
 File Name	: RegistrationError.cfm
 Description: This is the partial view template for printing errors.
 Created By	: Rahul Kumar
 Created	: 17 Aug 2016
=======================================================================
-->

		<cfparam name="Url.errors" default="">

		<cfif Url.errors NEQ "">
			<div class="text-sm-center text-danger">
				<span id="allErrors">
					<cfloop index="error" list="#Url.errors#" delimiters='\'>
						<cfoutput>#error#</cfoutput> <br />
					</cfloop>
				</span>
			</div>
		</cfif>
