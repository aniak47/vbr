class BackEndPagesController < ApplicationController
    before_action :logged_in_staff
    
    def main
    end
    
    def blog
        @blogpost = current_staff.blogposts.build if logged_in?
    end
    
    def add_staff
        
    end
    
    def  edit_profile
        
    end
    
end
