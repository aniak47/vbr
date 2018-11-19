class ArticlesController < ApplicationController
  before_action :logged_in_staff, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @article = current_staff.articles.build if logged_in?
    4.times {@article.images.build} 
  end

  def create
    @article = current_staff.articles.build(article_params)
        if @article.save
          flash[:success] = "Article created!"
          redirect_to '/news'
        else
          render 'new'
        end
  end
  
  def edit
    @article = Article.find(params[:id])
    4.times {@article.images.build} 
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:success] = "Article updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    #@article = Article.find(params[:id])
    @article = Article.find.find(:all, :order  => "published_at DESC")
  end

  def news
    @articles = Article.news
  end

  def sports
    @articles = Article.sports
  end
  
  def station_news
    @articles = Article.station
  end
  
  def destroy
    Article.find(params[:id]).destroy
    flash[:success] = "Article deleted"
    redirect_to '/news'
  end
  
    private
    
      def article_params
        params.require(:article).permit(:title, :subtitle, :content, :catergory, :video,
                        :images_attributes => [:id, :title, :description, :expire, :type, :picture, :_destroy])
      end
end
