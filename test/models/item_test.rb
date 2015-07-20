require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = items(:one)
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
    @item.customer = customers(:one)
    assert_respond_to @item, :customer
    assert_instance_of Customer, @item.customer
  end
end
