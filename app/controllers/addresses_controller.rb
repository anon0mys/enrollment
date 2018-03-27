class AddressesController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    student = Student.find(params[:student_id])
    if student.addresses.create(address_params)
      flash[:success] = "Your address was saved"
      redirect_to student_path(student)
    else
      flash[:failure] = "Your address was not saved"
    end
  end

  private

  def address_params
    params.require(:address).permit(:description,
                                    :street,
                                    :city,
                                    :state,
                                    :zipcode)
  end
end
