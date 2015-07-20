class Customer < ActiveRecord::Base
  has_secure_password
  has_many :items

  validates :name, presence: true
end
