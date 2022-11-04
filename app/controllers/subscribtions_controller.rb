class SubscribtionsController < ApplicationController
  def create
    @subscribtion = Subscribtion.find_or_create_by(recepient: recepient, subscriber: current_user)

    redirect_back fallback_location: root_path
  end

  def destroy
    @subscribtion = Subscribtion.find(params[:id])
    @subscribtion.destroy

    redirect_back fallback_location: root_path
  end

  private

  def recepient
    User.find_by id: params[:subscribtion][:recepient_id]
  end
end
