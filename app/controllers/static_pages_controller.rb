class StaticPagesController < ApplicationController
  def home
    @images = Image.carousel
    @blogs = Blogpost.limit(6)
    @podcasts = Podcast.limit(6)
    @events = Event.concert.future.limit(6)
    @cevents = Event.general.future.limit(6)
  end

  def help
  end
  
  def rockthewaters
    
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
  
  def social
  end
  
  def beine
  end
  
end
