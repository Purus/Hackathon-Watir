require 'watir-webdriver'
require 'watirgrid'

Before do |scenario|
 #$b = Watir::Browser.new :chrome

case ENV['BROWSER']
  when 'ff', 'Firefox'
	caps = Selenium::WebDriver::Remote::Capabilities.firefox
	caps.platform = :WINDOWS
	caps[:name] = "Watir WebDriver"

	$b = Watir::Browser.new(
	:remote,
	:url => "http://localhost:4444/wd/hub",
	:desired_capabilities => caps)
  
	$b.window.maximize
  
    #$b = Watir::Browser.new :firefox
    browser_name = 'Firefox'
	
  when 'chrome'
	
	caps = Selenium::WebDriver::Remote::Capabilities.chrome
	caps.platform = :WINDOWS
	caps[:name] = "Watir WebDriver"

	$b = Watir::Browser.new(
	:remote,
	:url => "http://localhost:4444/wd/hub",
	:desired_capabilities => caps)
		$b.window.maximize
		browser_name = 'chrome'
   when 'ie'
	caps = Selenium::WebDriver::Remote::Capabilities.ie
	caps.platform = :WINDOWS
	caps[:name] = "Watir WebDriver"

	$b = Watir::Browser.new(
	:remote,
	:url => "http://localhost:4444/wd/hub",
	:desired_capabilities => caps)
  
	$b.window.maximize
   #$b = Watir::Browser.new :ie
   browser_name = 'IE'
   
   environment = 'dev'
	url = 'http://www.shopclues.com'
	domain = 'http://www.shopclues.com'
	
	if ENV['CLIENT'].nil?
  client = 'user/password'
else
  client = ENV['CLIENT']
end
end

test_env = {   :browser => $b,
               :browser_name => browser_name,
               :url => url,
               :env => environment,
               :client => client,
               :login => nil,
               :domain => domain }

	
end

  
After do |scenario|
if scenario.failed?
    $b.screenshot.save 'screenshot.png'
    embed 'screenshot.png', 'image/png'
	#$b.quit
	#$b=nil
end 


end
