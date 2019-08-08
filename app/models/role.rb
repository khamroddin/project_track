class Role < ActiveRecord::Base
  has_many :users
  validates_uniqueness_of :name #, :scope => :sports_org_id
end
