class Client < ActiveRecord::Base
  belongs_to :organization

  validates :client_name,presence: true ,uniqueness: {scope: :organization_id}
end
