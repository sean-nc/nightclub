require 'test_helper'

class VenueTest < ActiveSupport::TestCase
  def setup
    @venue = Venue.new(email: "email@email.com", password: "password", password_confirmation: "password",
                       name: "EFS", location: "Toronto", age_of_entry: "19", capacity: 300,
                       music: "Top 40/Hip Hop", dress_code: "No runners, dress to impress.",
                       website: "https://efs.com", business_type: "Club")
  end

  test "should be valid" do
    assert @venue.valid?
  end

  test "name should be present" do
    @venue.name = ""
    assert_not @venue.valid?
  end

  test "age of entry should be present" do
    @venue.age_of_entry = ""
    assert_not @venue.valid?
  end

  test "business type should be present" do
    @venue.business_type = "      "
    assert_not @venue.valid?
  end
end
