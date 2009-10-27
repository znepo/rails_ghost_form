class GhostFormBuilder < ActionView::Helpers::FormBuilder
  
  def text_field(field, options = {})
    if @object.send(field).blank?
      options = set_options(options) 
    else
      options.delete(:ghost)
    end
    super(field, options)
  end
  
  def password_field(field, options = {})
    if @object.send(field).blank?
      options.merge!(:password => true)
      text_field(field, options)
    else
      options.delete(:ghost)
      super
    end
  end
  
  protected
  
  def set_options(options = {})
    options.has_key?(:class) ? options[:class] += " ghost" : options[:class] = "ghost"
    if options[:password] == true
      options[:class] += " ghosted_password" 
      options.delete(:password) 
    end
    options[:value] = options[:ghost]
    options.delete(:ghost)
    options
  end
  
end


module ApplicationHelper
  
  # Just a simple helper method for you to add ghosts to your stuffs
  def ghosted_form_for(record_or_name_or_array, *args, &proc)
    options = args.extract_options!
    options[:html] = options[:html] || {}
    options[:html][:class] ? options[:html][:class] += " ghosted_form" : options[:html][:class] = "ghosted_form"
    concat("", proc.binding)
    form_for(record_or_name_or_array, *(args << options.merge(:builder => GhostFormBuilder)), &proc)
    concat(javascript_include_tag("ghost_form.js"), proc.binding)
  end
  
end