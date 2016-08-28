<!---
 =======================================================================
 File Name	: _LeftMenuBar.cfm
 Description: Partial view file containing the categories section to be displayed in left of the pages.
 Created By	: Rahul Kumar
 Created	: 18 Aug 2016
=======================================================================
--->

		<div class="main-menu">
			<br /> <br /> <br /> <br /> <br />
			<cfloop index="loopCount" from="1" to=#Application.categoryList.RecordCount#>
				<li class="has-subnav">
					<a href="Category.cfm?cat=<cfoutput>#Application.categoryList.CategoryId[loopCount]#</cfoutput>">
						<img width="35" height="35" src="../Assets/Images/Category/<cfoutput>#Application.categoryList.CategoryImage[loopCount]#</cfoutput>" class="leftNavMargin" />
						<span class="nav-text leftNavMargin">
							<cfoutput>#Application.categoryList.CategoryName[loopCount]#</cfoutput>
						</span>
					</a>
				</li>
				<br />
			</cfloop>
		</div>

		<link rel="stylesheet" type="text/css" href="../Assets/StyleSheets/LeftNav.css"/>
