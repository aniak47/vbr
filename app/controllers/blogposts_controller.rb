class BlogpostsController < ApplicationController
    before_action :logged_in_staff, only: [:new, :create, :edit, :update, :destroy]
    before_action :correct_staff,   only: [:destroy, :edit, :update]
  
  def new
    @blogpost = current_staff.blogposts.build if logged_in?
  end
  
  def create
    @blogpost = current_staff.blogposts.build(blogpost_params)
    if @blogpost.save
      flash[:success] = "Blog post created!"
      redirect_to 'blogposts/index'
    else
      render 'blogposts/new'
    end
  end
  
  def edit
    @blogpost = Blogpost.find(params[:id])
  end
  
  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(blogpost_params)
      flash[:success] = "Blog updated"
      redirect_to @blogpost
    else
      render 'edit'
    end
  end
  
  def destroy
    @blogpost.destroy
    flash[:success] = "Blog post deleted"
    redirect_to request.referrer || root_url
  end
  
  def index
    @blogposts = Blogpost.paginate(page: params[:page])
  end
  
  def show
    @blogpost = Blogpost.find(params[:id])
  end

  private

    def blogpost_params
      params.require(:blogpost).permit(:title, :subtitle, :content, :picture)
    end
    
    def correct_staff
      @blogpost = current_staff.blogposts.find_by(id: params[:id])
      redirect_to root_url if @blogpost.nil?
    end
end
