class User < ActiveRecord::Base

  belongs_to :roles
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  def admin(user)
    if user.role_id == 1
      role = true
    else
      role = false
    end
    return role
  end
end
