require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @alex = users(:alex)
    @seb = users(:seb)
    @thanh = users(:thanh)
    @ruby_on_rails = courses(:ruby_on_rails)
    @booking = bookings(:booking)
  end

  test "booking should be valid" do
    assert @booking.valid?
  end

  test "a user should be able to destroy his own bookings" do
    sign_in @seb
    assert_difference 'Booking.count', -1 do
      delete booking_path(@booking)
    end
  end

  test "a user should not be able to destroy others bookings" do
    sign_in @alex
    assert_no_difference 'Booking.count' do
      delete booking_path(@booking)
    end
  end

  test "a user should be able to create a booking" do
    sign_in @thanh
    assert_difference 'Booking.count', 1 do
      post course_bookings_path(@ruby_on_rails)
    end
  end

  test "a non course owner should not be able to accept a user" do
    sign_in @thanh
    assert_raises Pundit::AuthorizationNotPerformedError do
      post update_approved_booking_path(@booking)
    end
  end

  test "a course owner should be able to accept a user" do
    sign_in @seb
    post update_approved_booking_path(@booking)
    assert @booking.approved
  end
end
