class Employee < ActiveRecord::Base
  belongs_to :employee_position
  belongs_to :employee_category
  belongs_to :organization

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: true
  validates :mobile,:presence => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }
  validates :employee_no , presence: true , uniqueness: {scope: :organization_id}
  validates :first_name , presence: true
  validates :organization_id , presence: true

  after_create :create_user

  def full_name
    self.first_name + " " + self.last_name
  end

  def create_user
   a= User.create(name: self.employee_no, role_id: 2, email: self.email, password: "pass"+self.employee_no)
  end
end
