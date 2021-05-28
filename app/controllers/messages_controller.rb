class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(message_params)
    @item = Item.find(params[:item_id])
    @messages = @item.messages.includes(:user).order('created_at DESC')
    if @message.valid?
      @message.save
      ActionCable.server.broadcast 'message_channel', message: @message, nickname: @message.user.nickname, time: @message.created_at, id: @item.id
      #redirect_to item_path(@item.id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end