require 'byebug'
require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'
require_relative './session'
require_relative './flash'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req # Rack obj
    @res = res # Rack obj
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
     @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    if @already_built_response
       raise "Double redirect error!"
    else
      @res.status = 302
      @res['Location'] = url
      @already_built_response = true
    end

    Session.store_session(@res)
    flash.store_store(@res)
    nil
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    if @already_built_response
      raise "Double render error!"
    else
      @res['Content-Type'] = content_type
      @res.write(content)
      @already_built_response = true
    end

    Session.store_session(@res)
    flash.store_store(@res)
    nil
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content

#  Use controller and template names to construct paths to template files.
# Use File.read to read the template file.
# Create a new ERB template from the contents.
# Evaluate the ERB template, using binding to capture the controller's instance variables.
# Pass the result to #render_content with a content_type of text/html.
  def render(template_name)
    # self is (should be) a controller class name

    # controller = self.class.scan(/\w+[^Controller]/).map(&:downcase)

    # because you expect no one to know regex yet apparently
    controller = self.class.to_s.underscore
    file_type = ".html.erb"
    path_start = "views"
    template_path = "#{path_start}/#{controller}/#{template_name}#{file_type}"

    file = File.read(template_path)
    file_erb = ERB.new(file).result(binding)

    render_content(file_erb, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  def flash
    @flash ||= Flash.new(@req)
  end


  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end
