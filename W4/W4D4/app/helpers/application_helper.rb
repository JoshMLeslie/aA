module ApplicationHelper

  def auth_token
    '<input type="hidden" name="authenticity_token" value=" h(#{form_authenticity_token})">'.html_safe
  end

  def show_errors
    <<-HTML.html_safe
    <% flash[:errors].try(:each) do |error| %>
    <%= error %>
    <% end %>
    HTML

  # <% show_errors, flash: flash[:errors] %>
  end

end
