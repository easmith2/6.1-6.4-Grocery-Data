require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:one)
  end

  test "the fixture is valid" do
    assert @customer.valid?
  end

  test "is invalid without name" do
    @customer.name = nil
    refute @customer.valid?
    assert @customer.errors.keys.include?(:name)
  end

  test "has many items" do
    assert_respond_to @customer, :items
    assert_instance_of Item, @customer.items.new
  end
end
