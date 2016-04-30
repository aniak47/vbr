class StaffsController < ApplicationController
  before_action :logged_in_staff, only: [:create, :new, :edit, :update, :destroy]
  before_action :correct_staff,   only: [:edit, :update]
  before_action :admin_staff, only: [:create, :new, :destroy]
  

  def show
    @staff = Staff.find(params[:id])
    @blogposts = @staff.blogposts.paginate(page: params[:page])
  end
  def index
    @week = Staff.active.activated.week
    @special = Staff.active.activated.special
  end
  def new
    @staff = Staff.new
  end
  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      @staff.send_activation_email
      flash[:info] = "New staff added."
      redirect_to root_url
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
  
  def destroy
    Staff.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to staffs_url
  end
  

  
  private
    def staff_params
      params.require(:staff).permit(:name, :email, :password, :password_confirmation, :active, :hometown, :fav_music,
                                            :duties, :intrests, :photo, :joktype)
    end
    
    # Before filters

    # Confirms the correct user.
    def correct_staff
      @staff = Staff.find(params[:id])
      redirect_to(root_url) unless current_staff?(@staff)
    end
   
end
