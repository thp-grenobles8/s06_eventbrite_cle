class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_events_organizing = []
    @user_events = []
    events_id = []
    # On cherche les EVENT_ID auquel notre @USER participe
    # > On insert l'EVENT_ID dans #find() afin d'effectuer une requette sur la table EVENTS
    @user.attendances.each do |attendance|
      event_id = attendance.event_id
      Event.find(event_id).administrator_id == current_user.id ?
      @user_events_organizing << Event.find(event_id) :
      @user_events << Event.find(event_id)
    end

  end
end
