# Uninstall hook code here
require File.join(File.dirname(__FILE__), "../../../config/environment")
require 'fileutils'
FileUtils.rm("#{Rails.root}/public/javascripts/ghost_form.js")