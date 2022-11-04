class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all.order(created_at: :asc)
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user: current_user)
  end
end
