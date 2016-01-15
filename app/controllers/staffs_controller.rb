class StaffsController < ApplicationController
  before_action :logged_in_staff, only: [:edit, :update]
  before_action :correct_staff,   only: [:edit, :update]
  
  def new
  end
  
  def show
    @staff = Staff.find(params[:id])
  end
  def index
    @staffs = Staff.paginate(page: params[:page])
  end
  def new
    @staff = Staff.new
  end
  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      log_in @staff
      flash[:success] = "Sign up successful!"
      redirect_to @staff
    else
      render 'new'
    end
  end
  def edit
    @staff = Staff.find(params[:id])
  end
  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_params)
      flash[:success] = "Profile updated"
      redirect_to @staff
    else
      render 'edit'
    end
  end
  
  private
    def staff_params
      params.require(:staff).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    # Before filters

    # Confirms a logged-in user.
    def logged_in_staff
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # Confirms the correct user.
    def correct_staff
      @staff = Staff.find(params[:id])
      redirect_to(root_url) unless current_staff?(@staff)
    end
end
