class InstructorsController < ApplicationController
  def show
    @instructors = Instructor.all.order(:last)
  end
end
