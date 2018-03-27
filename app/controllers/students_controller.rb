class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student = Student.new(student_params)
    if student.save
      flash[:sucess] = "#{student.name} was sucessfully created"
      redirect_to student_path(student)
    else
      flash[:failure] = 'Student was not created'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
