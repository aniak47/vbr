class SpecialtyShowsController < ApplicationController
    before_action :logged_in_staff, only: [:create, :new]
    
    def index
        @specialty_shows = SpecialtyShow.all
    end
    def show
        @specialty_show = SpecialtyShow.find(params[:id])
    end
    
    def new
        @specialty_show = SpecialtyShow.new
    end
    def create
        @specialty_show = SpecialtyShow.new(show_params)
        if @specialty_show.save
            flash[:success] = "Show Created!"
            redirect_to specialty_shows_path
        else
            render 'new'
        end
    end
    
    
    private
    
        def show_params
          params.require(:specialty_show).permit(:name, :description, :day,
                                       :start, :end)
        end
    
end
