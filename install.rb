# Install hook code here
puts "Copying ghost_form.js to public/javascript"
puts "Ensure that you have jQuery 1.3.2 installed also"
require 'fileutils'
FileUtils.cp((File.join(File.dirname(__FILE__), 'javascript', 'ghost_form.js')), "#{Rails.root}/public/javascripts/")