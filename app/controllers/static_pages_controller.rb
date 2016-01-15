class StaticPagesController < ApplicationController
  def home
    @blogpost = current_staff.blogposts.build if logged_in?
  end

  def help
  end
end
