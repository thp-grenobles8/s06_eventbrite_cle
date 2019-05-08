class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
    @attendees = Attendance.where(event_id: @event.id).count
    @administrator = User.where(id: @event.administrator_id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      start_date:       DateTime.new(params[:start_date_day].split("-")[0].to_i,
                        params[:start_date_day].split("-")[1].to_i,
                        params[:start_date_day].split("-")[2].to_i,
                        params[:start_date_hour].split("-")[0].to_i,
                        params[:start_date_hour].split("-")[1].to_i,
                        params[:start_date_hour].split("-")[2].to_i),
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
