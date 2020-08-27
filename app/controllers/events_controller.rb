class EventsController < ApplicationController
  def create
    party = ViewParty.find_by(id: params[:party_id])
    event = EventCoordinator.new.calendar_event(current_user, party)
  end
end
