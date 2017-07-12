class StaticPagesController < ApplicationController
  def home
    @images = Image.carousel
    @blogs = Blogpost.limit(3)
    @podcasts = Podcast.limit(3)
    @events = Event.concert.future.limit(4)
  end

  def about
  end
  
  def contact
  end
  
  def schedule
  end
  
  def weather
  end
  
  def history
  end
  
  def lineup
  end
  
  def donate
  end
  
  def advertise
  end

  def beine
  end
  
end
