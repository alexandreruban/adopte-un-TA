require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @user = users(:seb)
    @course = courses(:ruby_on_rails)
    @course.user = @user
  end

  test "course should be valid" do
    assert @course.valid?
  end

  test "course should have a title" do
    @course.title = "   "
    assert_not @course.valid?
  end

  test "course should have an address" do
    @course.address = "   "
    assert_not @course.valid?
  end

  test "course should have a description" do
    @course.description = "   "
    assert_not @course.valid?
  end

  test "course should have a begin_date" do
    @course.begin_date = ""
    assert_not @course.valid?
  end

  test "course should have a end_date" do
    @course.end_date = ""
    assert_not @course.valid?
  end

  test "start date should be before end date" do
    @course.end_date = Date.today - 1
    assert_not @course.valid?
  end
end
