class PasswordResetsController < ApplicationController
  before_action :get_staff,   only: [:edit, :update]
  before_action :valid_staff, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end
  
  def create
    @user = Staff.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:user][:password].empty?
      @staff.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @staff.update_attributes(staff_params)
      log_in @staff
      flash[:success] = "Password has been reset."
      redirect_to @staff
    else
      render 'edit'
    end
  end
  
    private
    
    def staff_params
      params.require(:staff).permit(:password, :password_confirmation)
    end

    def get_user
      @staff = Staff.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_staff
      unless (@staff && @staff.activated? &&
              @staff.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
    
    # Checks expiration of reset token.
    def check_expiration
      if @staff.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
