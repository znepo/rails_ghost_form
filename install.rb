# Install hook code here
require File.join(File.dirname(__FILE__), "../../../config/environment")
require 'fileutils'
ghost_form =  "#{Rails.root}/vendor/plugins/rails_ghost_form/javascripts/ghost_form.js"
puts "Copying #{ghost_form} to #{Rails.root}/public/javascript"
puts "Ensure that you have jQuery 1.3.2 installed also"


FileUtils.cp(ghost_form, "#{Rails.root}/public/javascripts/ghost_form.js")