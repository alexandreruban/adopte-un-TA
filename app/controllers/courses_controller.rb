class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = policy_scope(Course)
    @courses = policy_scope(Course)
      if params[:query].present?
        sql_query = " \
        courses.title ILIKE :query \
        OR courses.description ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
        "
        @courses = Course.joins(:user).where(sql_query, query: "%#{params[:query]}%")
      else
        @courses = Course.all
      end
    @markers = @courses.where.not(latitude: nil, longitude: nil).map do |course|
      {
        lat: course.latitude,
        lng: course.longitude,
        infoWindow: { content: render_to_string(partial: "/courses/map_box", locals: { course: course }) }
      }
    end
  end

  def show
    authorize @course
    @same_courses = Course.where(title: @course.title).reject { |c| c == @course }
    @other_courses = Course.where(user: @course.user).reject { |c| c == @course }
    @booking = Booking.where(user_id: current_user.id, course_id: params[:id]).first
    @markers = [ {
      lat: @course.latitude,
      lng: @course.longitude,
      infoWindow: { content: render_to_string(partial: "/courses/map_box", locals: { course: @course }) }
    } ]
  end

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    authorize @course
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def edit
    authorize @course
  end

  def update
    authorize @course
    @course.update(course_params)
    @course.save
    if @course.save
      respond_to do |format|
        format.html { redirect_to course_path(@course) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js  # <-- idem
      end
    end
  #   if @course.save
  #     redirect_to course_path(@course)
  #   else
  #     render :edit
  #   end
end

def destroy
  authorize @course
  @course.destroy
  redirect_to courses_path
end

private

def set_course
  @course = Course.find(params[:id])
end

def course_params
  params.require(:course).permit(:title, :description, :address, :price, :begin_date, :end_date, :photo)
end
end
