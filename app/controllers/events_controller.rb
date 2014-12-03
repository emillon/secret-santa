class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
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

  def draw
    @event = Event.find(params[:id])
    participants = @event.participants
    participants = participants.collect { |x| x }
    participants.shuffle!
    @draw = participants.zip(participants.rotate)
  end

  private

    def event_params
      params.require(:event).permit(:title, participants_attributes: [:id, :_destroy, :name, :email])
    end
end
