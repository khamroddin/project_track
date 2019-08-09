class Role < ActiveRecord::Base
  has_many :users
  validates :name,uniqueness: true,presence: true #, :scope => :sports_org_id
end
