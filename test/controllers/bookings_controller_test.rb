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

  test "as a non logged in user I can't book a course" do
    post course_bookings_path(@ruby_on_rails)
    assert_redirected_to new_user_session_path
  end

  test "a user should be able to destroy his own bookings" do
    sign_in @alex
    assert_difference 'Booking.count', -1 do
      delete booking_path(@booking)
    end
  end

  test "a user should not be able to destroy others bookings" do
    sign_in @thanh
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
    post update_approved_booking_path(@booking)
    assert_not @booking.reload.approved
  end

  test "a course owner should be able to accept a user" do
    sign_in @seb
    post update_approved_booking_url(@booking)
    assert @booking.reload.approved
  end

  test "a non loged in user should not be able to see a dashboard" do
    get bookings_path
    assert_redirected_to new_user_session_path
  end

  test "a non loged in user should not be able to see bookings dashboard" do
    get my_bookings_bookings_path
    assert_redirected_to new_user_session_path
  end

  test "a non loged in user should not be able to see courses dashboard" do
    get my_courses_bookings_path
    assert_redirected_to new_user_session_path
  end
end
