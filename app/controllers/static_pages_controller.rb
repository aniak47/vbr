class StaticPagesController < ApplicationController
  def home
    @images = Image.carousel
    @blogs = Blogpost.limit(6).in_groups_of(2)
    @podcasts = Podcast.limit(10)
    @news = Article.news.limit(10)
    @image = Image.first
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def schedule
  end
  
  def history
  end
  
  def lineup
  end
  
  def donate
  end
  
  def advertise
  end
  
  def social
  end
  
end
