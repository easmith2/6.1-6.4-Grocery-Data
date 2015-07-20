class Item < ActiveRecord::Base
  belongs_to :customer

  validates :name, :price_in_cents, presence: true

  def self.for_customer(customer)
    where(customer_id: customer.id)
  end
end
