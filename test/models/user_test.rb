require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new({
      first_name: "Alex",
      last_name: "Daniel",
      email: "foobar@foo.com",
      password: "foobar",
      password_confirmation: "foobar"
    })
  end

  test "should accept user with valid params" do
    assert @user.valid?
  end

  test "user first_name should be present" do
    @user.first_name = "    "
    assert_not @user.valid?
  end

  test "user last_name should be present" do
    @user.last_name = "    "
    assert_not @user.valid?
  end

  test "user password should be present" do
    @user.password = "    "
    assert_not @user.valid?
  end

  test "password and password_confirmation should be the same" do
    @user.password = "notthesame"
    assert_not @user.valid?
  end

  test "should not accept invalid emails" do
    invalid_emails = %w[foobar 1234@1234 @gmail.com]
    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end
end
