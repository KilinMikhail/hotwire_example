class MessagesController < ApplicationController
  before_action :set_messages
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  def index
    @message = Message.new
  end

  def show
  end

  def edit
    authorize! @message
  end

  def update
    authorize! @message

    if @message.update(message_params)
      broadcast_message_updated
      redirect_to messages_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      broadcast_message_created
      redirect_to messages_path
    else
      @messages = Message.all
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! @message

    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_path }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@message) }
    end
  end

  private

  def broadcast_message_created
    Turbo::StreamsChannel.broadcast_render_to(
      [:messages], template: "messages/created", locals: { message: @message }
    )
  end

  def broadcast_message_updated
    Turbo::StreamsChannel.broadcast_render_to(
      [:messages], template: "messages/updated", locals: { message: @message }
    )
  end

  def broadcast_message_destroyed
    Turbo::StreamsChannel.broadcast_render_to(
      [:messages], template: "messages/destroyed"
    )
  end

  def message_params
    params.require(:message).permit(:content, :replied_to_id).merge(user: current_user)
  end

  def set_messages
    @messages = Message.all.order(created_at: :asc)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
