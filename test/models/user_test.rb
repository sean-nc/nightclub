require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    date = Date.today - 19.years
    @user = User.new(username: "Sean", email: "user@example.com", date_of_birth: date,
                     location: "Toronto", mobile: "4165791911", gender: "Male",
                     password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "date of birth should be present" do
    @user.date_of_birth = ""
    assert_not @user.valid?
  end

  test "location should be present" do
    @user.location = ""
    assert_not @user.valid?
  end
  test "mobile should be present" do
    @user.mobile = ""
    assert_not @user.valid?
  end

  test "gender should be present" do
    @user.gender = ""
    assert_not @user.valid?
  end

  test "age should be legal" do
    @user.date_of_birth = Date.today
    assert_not @user.valid?
  end

  test "gender should be male, female or other" do
    @user.gender = "Nothing"
    assert_not @user.valid?
  end
end