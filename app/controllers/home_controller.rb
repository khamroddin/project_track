class HomeController < ApplicationController
   before_filter :authenticate_user!
   layout :determine_layout

   def determine_layout
     role = current_user.role_id.to_s
     return (role.eql?('1') ? "application" : "employee")
   end

   def index
     path = case current_user.role_id.to_s
              when '1'
                home_dash_board_path
              when '2'
                home_employee_projects_path
              else
                home_employee_projects_path
            end

     redirect_to path
   end

   def dash_board

   end
   def employee_projects
      @projects = current_user.employee.projects rescue nil

   end
end
