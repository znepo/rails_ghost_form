# Install hook code here
require 'fileutils'
FileUtils.cp((File.join(File.dirname(__FILE__), 'javascript', 'ghost_form.js')), "#{Rails.root}/public/javascripts/")