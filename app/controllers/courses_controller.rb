class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @students = @course.students
  end
end
