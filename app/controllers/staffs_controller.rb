class StaffsController < ApplicationController
  
  def new
  end
  
  def show
    @staff = Staff.find(params[:id])
  end
  
  def new
    @staff = Staff.new
  end
  def create
    @staff = Staff.new(staff_params)    # Not the final implementation!
    if @staff.save
      log_in @staff
      flash[:success] = "Sign up successful!"
      redirect_to @staff
    else
      render 'new'
    end
  end
  
  private
    def staff_params
      params.require(:staff).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
