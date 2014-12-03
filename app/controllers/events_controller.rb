class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    if @event.save
      pass
    else
      render 'new'
    end
  end
end
