require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @ruby_on_rails = courses(:ruby_on_rails)
    @alex = users(:alex)
    @seb = users(:seb)
  end

  test "ruby on rails course should be valid" do
    assert @ruby_on_rails.valid?
  end

  test "as a non logged in user I can see all the courses" do
    get courses_path
    assert_response :success
  end

  test "as a non logged in user I can see a course" do
    get course_path @ruby_on_rails
    assert_response :success
  end
end
