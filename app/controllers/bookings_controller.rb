class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @courses = Course.where(user: current_user)
  end

  def create
    course = Course.find(params[:course_id])
    booking = Booking.new
    booking.course = course
    booking.user = current_user
    if booking.save
      redirect_to bookings_path
    else
      redirect_to root_url
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "Booking successfully deleted"
    redirect_to bookings_path
  end

  def approve_student
    booking = Booking.find(params[:id])
    booking.update(approved: true)
    redirect_to bookings_path
  end
end
