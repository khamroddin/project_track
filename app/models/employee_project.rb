class EmployeeProject < ActiveRecord::Base
  belongs_to :employee
  belongs_to :project
  validates :employee_id,presence: true ,uniqueness: {scope: :project_id}

end
