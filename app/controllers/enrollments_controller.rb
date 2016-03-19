class EnrollmentsController < ApplicationController
  def new
    @enroll = Enrollment.create(course_code: params[:code], user_email: current_user.email)
  end

end
