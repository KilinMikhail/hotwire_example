# frozen_string_literal: true

class SubscribtionsReflex < ApplicationReflex
  def subscribe
    @subscribtion = Subscribtion.find_or_create_by(recepient: recepient, subscriber: current_user)
  end

  def unsubscribe
    @subscribtion = current_user.sent_subscribtions.find(element.dataset[:subscribtion_id])
    @subscribtion.destroy

    morph("#subscribe-buttons", render(partial: "users/subscribe_buttons", locals: {subscribtion: @subscribtion}))
  end

  private

  def recepient
    User.find_by id: element.dataset[:recepient_id]
  end
end
