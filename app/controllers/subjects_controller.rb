class SubjectsController < ApplicationController
  def show
    @subjects = Subject.all.order(:name).uniq
  end

end
