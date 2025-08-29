class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user = current_user

     authorize @message 

    if @message.save
      redirect_to @chat, notice: 'Message envoyé!'
    else
      redirect_to @chat, alert: 'Erreur lors de l\'envoi.'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
