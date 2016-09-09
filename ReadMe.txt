This is the README file for ShoppingSite.

ShoppingSite is a web application for basic shopping site. It follows MVC pattern and the files are
distributed into Views, Models and Controllers and additionally there are scripts( JavaScript ) and
stylesheets( CSS file ). The bootstrap framework is also included.

TECHNOLOGIES USED:
- HTML5
- CSS
- JavaScript
- ColdFusion
- DB: SQL Server 2012
- Hoisting: IIS( port: 800 )


FEATURES:
- Category, products, register, login, cart and checkout pages
- Registration and login facility
- Adding to cart, manipulating quantity in cart
- Order summary at checkout page and placing orders
- Saving address into DB for registered users


FILES:
- ReadMe.txt ...................... The file you are currently reading
- Assets .......................... Other files included in the application
- - /Images ....................... Images used in the application
- - - /Category ................... One image to represent each category
- - - /Product .................... One image for each product
- - /Scripts ...................... Javascript files
- - /StyleSheets .................. CSS files
- Controllers ..................... CFC files controlling the flow in application
- Docs ............................ Documentation/specification of the project
- Models .......................... Functionalities implemented in CFC files
- SQL Queries ..................... Queries used in the DB
- Views ........................... Visual templates for each page
	(includes some partial views: distinguished by an underscore(_) in the beginning of the file name ) 
- Application.cfc ................. The application wide attributes and methods
- Index.cfm ....................... The main page of the application
