class CoursesController < ApplicationController
  def show
    @courses = Course.all.order(:code)
  end

end
