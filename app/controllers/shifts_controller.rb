class ShiftsController < ApplicationController
  include ShiftsHelper
  
  before_action :logged_in_staff, only: [:create, :new, :edit, :update, :destroy]
  
  def new
    @shift = Shift.new
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def index
    @shifts = Shift.all
  end
  
  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      shift_staff
      redirect_to shifts_url
    else
      render 'new'
    end
  end
  
  def destroy
    Shift.find(params[:id]).destroy
    flash[:success] = "Shift deleted"
    redirect_to shifts_url
  end
  
  def update
    @shift = Shift.find(params[:id])
    if @shift.update_attributes(shift_params)
      flash[:success] = "Shift updated"
      redirect_to shifts_url
    else
      render 'edit'
    end
  end
  
  def schedule
    @date = Date.today
    @shifts = Shift.all.group_by(&:day)
  end
  
  private
    
    def shift_params
      params.require(:shift).permit(:title, :blurb, :start, :end, :day, :color)
    end 
    
    def shift_staff
        staff_ids = params[:choice]
        staff_ids.each do |id|
          if id.to_i > 0
              s = Staff.find(id) 
              @shift.staffs << s
          end
        end
    end
end