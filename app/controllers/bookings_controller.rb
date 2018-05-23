class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
    @courses = Course.where(user: current_user)
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new
    @booking.course = @course
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = "An error occured"
      redirect_to course_path(@course)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    flash[:notice] = "Booking successfully deleted"
    redirect_to bookings_path
  end

  def update_approved
    booking = Booking.find(params[:id])
    authorize booking
    booking.update(approved: !booking.approved)
    redirect_to bookings_path
  end
end
