class DrawsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    if @event.draws.any?
      redirect_to event_draw_url(@event)
    end
  end

  def show
    @event = Event.find(params[:event_id])
    if @event.draws.empty?
      redirect_to new_event_draw_url
    end
  end

  def update
    @event = Event.find(params[:event_id])
    order = @event.draw_order
    if order.nil?
      flash[:danger] = 'Constraints could not be satisfied. You can remove some of them and try again.'
    else
      for (giver, receiver) in order
        draw = Draw.new(giver: giver, receiver: receiver)
        @event.draws << draw
        draw.save
      end
      for draw in @event.draws
        draw.send_email
      end
      flash[:success] = 'Ballots have been drawn and emails sent.'
    end
    redirect_to @event
  end
end
