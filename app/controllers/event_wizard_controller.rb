class EventWizardController < ApplicationController
  def info
  end
  
  def post_info
    @event = Event.new title: params[:title]
  end

  def participants
  end

  def constraints
  end

  def confirm
  end
end
