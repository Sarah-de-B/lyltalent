class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user = current_user

     authorize @message

    if @message.save
      # refresh
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
              locals: { message: @message, user: current_user })
          end
          format.html { redirect_to chat_path(@chat) }
        end
    else
      redirect_to @chat, alert: 'Erreur lors de l\'envoi.'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
