class PodcastsController < ApplicationController
  before_action :logged_in_staff, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @podcast = current_staff.podcasts.build if logged_in?
    @podcast.build_image
  end
  
  def create
    @podcast = current_staff.podcasts.build(podcast_params)
    if @podcast.save
      flash[:success] = "Podcast created!"
      redirect_to @podcast
    else
      render 'new'
    end
  end

  def edit
    @podcast = Podcast.find(params[:id])
    @podcast.build_image if @podcast.image.nil?
  end
  
  def update
    @podcast = Podcast.find(params[:id])
    if @podcast.update_attributes(podcast_params)
      flash[:success] = "Blog updated"
      redirect_to @podcast
    else
      render 'edit'
    end
  end
  
  def destroy
    Podcast.find(params[:id]).destroy
    flash[:success] = "Podcast deleted"
    redirect_to request.referrer || 'index'
  end

  def index
    @podcasts = Podcast.paginate(page: params[:page], :per_page => 30)
  end

  def show
    @podcast = Podcast.find(params[:id])
  end
  
  def shows
    @shows = Show.podcast
  end
  
  private

    def podcast_params
      params.require(:podcast).permit(:title, :description, :audio, :catergory,
                        :image_attributes => [:id, :title, :description, :catergory, :picture])
    end
    
end
