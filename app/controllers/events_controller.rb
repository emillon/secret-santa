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
    if @event.draws.any?
      flash[:info] = "The ballots for this event have already been drawn."
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.draws.any?
      redirect_to @event
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.draws.any?
      redirect_to @event
    end
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

    def event_params
      params.require(:event).permit(:title,
                                    :locale,
                                    participants_attributes: [:id, :_destroy, :name, :email],
                                    constraints_attributes: [:id, :_destroy, :one_id, :other_id]
                                   )
    end
end
