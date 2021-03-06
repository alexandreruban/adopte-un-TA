class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
    @courses_given = Course.where(user: current_user).count
    @courses_taken = Booking.where(user: current_user, approved: true).count
    @total_revenue = Course.joins(:user, :bookings)
    .where("users.id = ? AND bookings.approved = ?", current_user.id, true)
    .sum("courses.price").to_i
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
    authorize @bookings
  end

  def my_courses
    @courses = Course.where(user: current_user)
    authorize @courses
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new
    @booking.course = @course
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to my_bookings_bookings_path
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
    redirect_to my_bookings_bookings_path
  end

  def update_approved
    booking = Booking.find(params[:id])
    authorize booking
    booking.update(approved: !booking.approved)
    redirect_to my_courses_bookings_path
  end
end
