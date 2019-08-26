class Project < ActiveRecord::Base

  validates :project_name,presence: true
  validates :client_id,presence: true

  belongs_to :client
  belongs_to :manager, class_name: 'Employee'
  has_many :employee_projects,:foreign_key => 'project_id'


end
