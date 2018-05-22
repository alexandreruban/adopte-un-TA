class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @courses = Course.all.sample(3)
    @courses = policy_scope(Course)

  end
end
