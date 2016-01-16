class StaticPagesController < ApplicationController
  def home
    @blogpost = current_staff.blogposts.build if logged_in?
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
  
  
end
