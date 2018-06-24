class ImagesController < ApplicationController
    before_action :logged_in_staff, only: [:new, :create, :edit, :update, :destroy]
    
    def new
        @image = Image.new
    end
    
    def create
        @image = Image.new(image_params)
        if @image.save
          flash[:success] = "Image created!"
          redirect_to '/images'
        else
          render 'carousel'
        end
    end
    
    def update
    end
    
    def destroy
        Image.find(params[:id]).destroy
        flash[:success] = "Image deleted"
        redirect_to mancar_url
    end
    
    def index
        @images = Image.all
    end
    
    private
        def image_params
            params.require(:image).permit(:title, :description, :expire, :catergory, :picture)
        end  
end
