class Customer < ActiveRecord::Base
  has_secure_password
  has_many :items

  validates :name, :email, presence: true
end
