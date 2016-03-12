require 'watir-webdriver'
require 'watirgrid'

##Login Page
Given (/^The App is launched$/) do
$b.goto 'http://www.shopclues.com'
t = $b.div(:class => 'auth-container').exists?
	if t == true
		$b.element(:class => 'close').click
	else
		puts "no notification"
	end
end

When (/^Login with invalid credentials$/) do
$b.div(:id => 'login_user_data').click
$b.text_field(:id => 'email').set 'hot29ramesh1989@gmail.com'
$b.text_field(:id => 'password').set '123456@'
$b.button(:class => 'ml_function_button').click
end

Then (/^verify system throws 'invalid login'$/) do
t = $b.div(:id => 'login_error').exists?

	if t == true
		puts "invalid login"
	else
		raise "Invalid login working"
	end
end


When (/^login with valid credentials$/) do
$b.div(:id => 'login_user_data').click
$b.text_field(:id => 'email').set 'hot29ramesh1989@gmail.com'
$b.text_field(:id => 'password').set 'ilikegod2@'
$b.button(:class => 'ml_function_button').click
end

Then (/^system should login and go to user account$/) do
txt = $b.span(:class => 'bold').text
	if txt == "ramesh"
		puts "Logged into correct account"

	else
		raise "Logged into wrong user"
	end
end

##Shop by categories
Then (/^Verify that 'Shop by category' is displayed in home page$/) do
 #t = $b.li(:class => 'top-ctgry').exists?
 e = $b.div(:class => 'site-categories').exists?
 
	if e == true
		puts "Shop by category is displayed in home page"
		
	else
		raise "Shop by category is not displayed in home page"
	end
end

Then (/^Go to 'Account'$/) do
$b.div(:id => 'login_user_data').click
end

Then (/^Verify that 'Shop by category' is displayed in account page$/) do
$b.li(:class => 'top-ctgry').click
 e = $b.li(:class => 'mobile-tablets main_menu_hover_cond').exists?
 
	if e == true
		puts "Shop by category is displayed in account page"
		
	else
		raise "Shop by category is not displayed in account page"
	end
end
























