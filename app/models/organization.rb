class Organization < ActiveRecord::Base
  validates :name,uniqueness: true,presence: true
  belongs_to :location
  has_many :employees

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
