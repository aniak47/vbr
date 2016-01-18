class EventsController < ApplicationController
  def index
    @events = Event.paginate(page: params[:page])
    @events_by_date = Event.all.group_by(&:date)
    @date = params[:date]? Date.parse(params[:date]) : Date.today
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url
    else
      render new
    end
  end
  
  def promo
  end
  
  private
    
    def event_params
      params.require(:event).permit(:name, :blurb, :date, :time, :location, :catergory)
    end
end
