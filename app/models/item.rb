class Item < ActiveRecord::Base
  belongs_to :customer

  validates :name, :price_in_cents, presence: true
end
