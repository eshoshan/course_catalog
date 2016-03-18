class SearchController < ApplicationController
  def index
      @search = ""
      subjects = Subject.all.order(:name)
      @subjects = [['Select', '-1']]
      subjects.each { |a|
        e = [a.name, a.name]
        @subjects.append(e)
      }
  end

  def indexed

    #all classes for specific subject
    if params[:classname].empty? && !(params[:subjectselect]=='-1')
      @search = Course.where(code: Subjectcourse.select(:course_code).where("subject_name LIKE ?", "%#{params[:subjectselect]}")).order(:name).uniq


    #all classes with title name - in any subject
  elsif params[:subjectselect]=='-1' && !(params[:classname].empty?)
      @search = Course.where("name LIKE ?", "%#{params[:classname]}")


    #subject and course name are specified
  elsif !(params[:classname].empty?) && !(params[:subjectselect]=='-1')
      @search = Course.where("name LIKE ?", "%#{params[:classname]}").where(code: Subjectcourse.select(:course_code).where("subject_name LIKE ?", "%#{params[:subjectselect]}")).order(:name).uniq
    end

  end
end
