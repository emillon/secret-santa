class DrawsController < ApplicationController
  def new
  end

  def show
    redirect_to new_event_draw_url
  end
end
