class EventsController < ApplicationController
  def show
    @event = Event.includes(:petitions).find_by(id: params[:id])
  end
end
