class UsersController < ApplicationController
  before_action :own_profil?, only: [:show]

  def show
    # skinny controller they said... (j'aurais du utiliser des where j'crois)
    # trop sale pour répondre au cahier des charges ahah
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

    private


  def own_profil?
    unless current_user == User.find_by(id: params[:id])
      flash[:danger] = "Stalking is creepy."
      redirect_to :root
    end
  end
end
