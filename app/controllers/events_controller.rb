class EventsController < ApplicationController
  before_action :logged_in_staff, only: [:new, :edit, :update, :destroy, :approve]
  before_action :admin_staff, only: [:approve]
  
  def index
    @events_by_date = Event.general.group_by(&:date)
    @date = params[:date]? Date.parse(params[:date]) : Date.today
  end
  
  def approve
    @events = Event.unapproved
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
      flash[:success] = "Your event has been submitted"
      redirect_to events_url
    else
      if current_staff
        render 'new'
      else
        render 'submit'
      end
    end
  end
  
  def submit
    @event = Event.new
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
  
  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_url
  end
  
  def promo
    @promos = Event.future.where(catergory: 'Promo')
    @articles = Article.promo
  end
  
  def concerts
    @events = Event.concert.future.limit(20)
    @events_by_date = Event.concert.group_by(&:date)
    @date = params[:date]? Date.parse(params[:date]) : Date.today
  end
  
  private
    
    def event_params
      params.require(:event).permit(:name, :blurb, :date, :time, :location, :catergory)
    end
end
