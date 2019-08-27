class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :determine_layout

  def determine_layout
    module_name = self.class.to_s.split("::").first
    return "dashboard" if module_name.eql?("Devise")
    return "employee" if current_user.present? and current_user.role_id == 2
    "application"
  end

end
