class User < ActiveRecord::Base

  belongs_to :roles
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_one :employee_entry,:class_name=>"Employee",:foreign_key=>"user_id"

  def admin(user)
    if user.role_id == 1
      role = true
    else
      role = false
    end
    return role
  end

  def employee_record
    self.employee_entry
  end
end
