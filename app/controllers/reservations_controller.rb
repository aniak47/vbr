class ReservationsController < ApplicationController
    before_action :logged_in_staff, only: [:approve, :approve_reservation]
    before_action :admin_staff, only: [:approve, :approve_reservation]
    
    
    def submit
        @event = Event.new
    end
    
    def calendar 
        @events_by_date = Event.ares.group_by(&:date)
        @date = params[:date]? Date.parse(params[:date]) : Date.today
    end
    
    def approve
        @events = Event.ures
        @approved = Event.ares
    end
    
    def info
        
    end
    
    def approve_reservation
        @event = Event.find(params[:id])
        @event.update_attribute(:catergory, "Areservation")
        redirect_to '/reservations/approve'
        
    end
    
    
    
end
