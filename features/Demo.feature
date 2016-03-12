Feature: Demo

Scenario: Login
	Given The App is launched
	When Login with invalid credentials
	Then verify system throws 'invalid login'
	When login with valid credentials
	Then system should login and go to user account
	
Scenario: Shop By Category
	Given The App is launched
	When login with valid credentials
	Then Verify that 'Shop by category' is displayed in home page
	Then Go to 'Account'
	Then Verify that 'Shop by category' is displayed in account page
	

	
	