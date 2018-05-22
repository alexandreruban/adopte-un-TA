require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @alex = users(:alex)
    @seb = users(:seb)
    @ruby_on_rails = courses(:ruby_on_rails)
    @booking = Booking.new(user_id: @alex.id, course_id: @ruby_on_rails.id)
  end

  test "a user should be able to destroy his own bookings" do
    log_in_as(@alex)
    @booking.save
    assert_difference 'Booking.count', -1 do
      @booking.destroy
    end
  end
end

