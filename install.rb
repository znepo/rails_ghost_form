# Install hook code here

require 'fileutils'
ghost_form = File.join(File.dirname(__FILE__), 'javascripts', 'ghost_form.js')
puts "Copying #{ghost_form} to #{Rails.root}/public/javascript"
puts "Ensure that you have jQuery 1.3.2 installed also"
FileUtils.cp((), "#{Rails.root}/public/javascripts/")