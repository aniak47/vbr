class TopTensController < ApplicationController
  def new
    @top = current_staff.top_tens.build if logged_in?
  end
  
  def create
    @top = current_staff.top_tens.build(top_params)
    if @top.save
      flash[:success] = "Top Ten post created!"
      redirect_to @top
    else
      render 'new'
    end
  end

  def edit
    @top = TopTen.find(params[:id])
  end
  
  def update
    @top = TopTen.find(params[:id])
    if @top.update_attributes(top_params)
      flash[:success] = "Top Ten updated"
      redirect_to @top
    else
      render 'edit'
    end
  end
  
  def delete
  end

  def show
    @top = TopTen.find(params[:id])
  end

  def index
    @tops = TopTen.paginate(page: params[:page])
  end
  
  private 
  
    def top_params
      params.require(:top_ten).permit(:title, :description, :one_song, :one_artist, :two_song, :two_artist, :three_song, :three_artist,
                            :four_song, :four_artist, :five_song, :five_artist, :six_song, :six_artist, :seven_song, :seven_artist,
                            :eight_song, :eight_artist, :nine_song, :nine_artist, :ten_song, :ten_artist)
    end
end
