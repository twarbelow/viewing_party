class ViewPartiesController < ApplicationController
  before_action :verify_current_user

  def create
    vp = ViewParty.new(view_party_params)
    vp.user_id = current_user.id
    if vp.save
      flash[:notice] = "Successfully created a viewing party on #{vp.when}!"
      redirect_to root_path
    else
      flash[:error] = vp.errors.full_sentences
      render :new
    end
  end

  def new
    @viewing_party = ViewParty.new(movie_title: params[:title], duration: params[:runtime])
  end

  private

  def view_party_params
    params.require(:view_party).permit(:movie_title, :duration, :when, user_ids:[])
  end
end
