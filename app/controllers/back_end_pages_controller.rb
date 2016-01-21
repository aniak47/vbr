class BackEndPagesController < ApplicationController
    before_action :logged_in_staff
    
    def main
    end

    def add_carousel
        @image = Image.new
    end
    
    def manage_car
        @images = Image.carousel
    end

    
end
