class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      start_date:       params[:start_date_day] + " " +
                        params[:start_date_hour],
      duration:         params[:duration],
      title:            params[:description],
      description:      params[:description],
      price:            params[:price],
      location:         params[:location],
      administrator_id: params[:administrator_id]
    )

    if @event.save
      redirect_to :root
      flash[:success] = "Event created !"
    else
      render :new
      flash[:danger] = "Couldn't create your event"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
