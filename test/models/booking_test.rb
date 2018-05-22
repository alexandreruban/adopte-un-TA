require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  def setup
    @alex = users(:alex)
    @seb = users(:seb)
    @ruby_on_rails = courses(:ruby_on_rails)
    @booking = Booking.new(user_id: @alex.id, course_id: @ruby_on_rails.id)
  end

  test "booking should be valid" do
    assert @booking.valid?
    @booking.save
    assert_equal @booking.reload.approved, false
  end

  test "booking should have a user_id" do
    @booking.user_id = nil
    assert_not @booking.valid?
  end

  test "booking should have a course_id" do
    @booking.course_id = nil
    assert_not @booking.valid?
  end

  test "a user should not be able to book the same course twice" do
    same_booking = @booking.dup
    @booking.save
    assert_not same_booking.valid?
  end
end
