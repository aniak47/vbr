class EventsController < ApplicationController
  before_action :logged_in_staff, only: [:create, :new, :edit, :update, :destroy]
  
  def index
    @events = Event.future.paginate(page: params[:page])
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
      render 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end
  
  def delete
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
  end
  
  def promo
    @promos = Event.where(catergory: 'Promo')
    @articles = Article.promo
  end
  
  def concerts
    @events = Event.concert
  end
  
  private
    
    def event_params
      params.require(:event).permit(:name, :blurb, :date, :time, :location, :catergory)
    end
end
