class MessagesController < ApplicationController
  before_action :set_messages
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_path
    else
      @messages = Message.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :replied_to_id).merge(user: current_user)
  end

  def set_messages
    @messages = Message.all.order(created_at: :asc)
  end
end
