require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = items(:one)
    @customer = customers(:one)
  end

  test "the fixture is valid" do
    assert @item.valid?
  end

  test "is invalid without name" do
    @item.name = nil
    refute @item.valid?
    assert @item.errors.keys.include?(:name)
  end

  test "is invalid without price_in_cents" do
    @item.price_in_cents = nil
    refute @item.valid?
    assert @item.errors.keys.include?(:price_in_cents)
  end

  test "belongs to customer" do
    @item.customer = @customer
    assert_respond_to @item, :customer
    assert_instance_of Customer, @item.customer
  end

  test "for_customer includes item belonging to current customer" do
    item = Item.create!(name: 'Chicken', price_in_cents: 800, category: 'Poultry')
    item.update_attributes(customer_id: @customer.id)
    item.save
    assert @customer.items.include?(item)
  end

  test "for_customer excludes items not belonging to current customer" do
    item = Item.create!(name: 'Chicken', price_in_cents: 800, category: 'Poultry')
    item.update_attributes(customer_id: nil)
    item.save
    refute @customer.items.include?(item)
  end
end
