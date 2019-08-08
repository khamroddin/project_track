class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :roles
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
end
