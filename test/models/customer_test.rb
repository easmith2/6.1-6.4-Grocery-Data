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

  test "is invalid without email" do
    @customer.email = nil
    refute @customer.valid?
    assert @customer.errors.keys.include?(:email)
  end

  test "is invalid without password" do
    customer = Customer.new(name: 'Han',
                            email: 'han@solo.com',
                            password: nil,
                            password_confirmation: nil
                            )
    refute customer.valid?
    assert customer.errors.keys.include?(:password)
  end

  test "is invalid without matching password confirmation" do
    customer = Customer.new(name: 'Han',
                            email: 'han@solo.com',
                            password: nil,
                            password_confirmation: 'beepboopbeep'
                            )
    refute customer.valid?
    assert customer.errors.keys.include?(:password)
  end

  test "has many items" do
    assert_respond_to @customer, :items
    assert_instance_of Item, @customer.items.new
  end
end
