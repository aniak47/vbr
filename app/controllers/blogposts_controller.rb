class BlogpostsController < ApplicationController
    before_action :logged_in_staff, only: [:create, :destroy]
    before_action :correct_staff,   only: :destroy

  def create
    @blogpost = current_staff.blogposts.build(blogpost_params)
    if @blogpost.save
      flash[:success] = "Blog post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @blogpost.destroy
    flash[:success] = "Blog post deleted"
    redirect_to request.referrer || root_url
  end

  private

    def blogpost_params
      params.require(:blogpost).permit(:content, :picture)
    end
    
    def correct_staff
      @blogpost = current_staff.blogposts.find_by(id: params[:id])
      redirect_to root_url if @blogpost.nil?
    end
end
