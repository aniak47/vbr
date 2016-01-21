class StaticPagesController < ApplicationController
  def home
    @images = Image.carousel
    @blogs = Blogpost.limit(10)
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
