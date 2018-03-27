class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @addresses = @student.addresses
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

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    if student.update(student_params)
      flash[:sucess] = "#{student.name} was sucessfully updated"
      redirect_to student_path(student)
    else
      flash[:failure] = 'Student was not created'
    end
  end

  def destroy
    student = Student.find(params[:id])
    if student.destroy
      flash[:success] = "#{student.name} was successfully deleted"
      redirect_to students_path
    else
      flash[:failure] = "#{student.name} was not deleted"
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
