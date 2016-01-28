class ShowsController < ApplicationController
    before_action :logged_in_staff, only: [:create, :new, :edit, :update, :delete]
    # before_action :can_access, only: [:create, :new, :edit, :update, :delete]
    before_action :admin_staff, only: [:delete, :new]
    
    def index
        @specialty_shows = Show.all
    end
    def show
        @show = Show.find(params[:id])
    end
    
    def new
        @show = Show.new
        @show.images.build
    end
    def create
        @show = Show.new(show_params)
        if @show.save
            show_staff
            flash[:success] = "Show Created!"
            redirect_to shows_path
        else
            render 'new'
        end
    end
    
    def edit
        @show = Show.find(params[:id])
    end
  
    def update
        @show = Show.find(params[:id])
        if @show.update_attributes(show_params)
          show_staff
          flash[:success] = "Show updated"
          redirect_to @show
        else
          render 'edit'
        end
    end
    
    def destroy
        Show.find(params[:id]).destroy
        flash[:success] = "Show deleted"
        redirect_to shows_url
    end
    
    private
    
        def show_params
          params.require(:show).permit(:name, :description, :day, :start, :end, 
                        :images_attributes => [:id, :title, :descrption, :expire, :type, :picture])
        end
        
        def can_access
            @show = current_staff.shows.find_by(id: params[:id])
            redirect_to root_url unless !@show.nil? || admin_staff
        end
        
        def show_staff
            staff_ids = params[:choice]
            staff_ids.each do |id|
                if id.to_i > 0
                    s = Staff.find(id) 
                    @show.staffs << s
                end
            end
        end
end
