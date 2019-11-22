class MessagesController < ApplicationController
  def new
    @message = Message.new
    @user = params[:user_id]
  end

  def create
    @message = Message.new(message_params)
    @message.from_id = current_user.id
    @message.to_id = params[:user_id]
    @user = User.find(params[:user_id])
    @message.room_id = message_room_id(current_user, @user)
    @message.save!
    @room_id = message_room_id(current_user, @user)
    @messages = Message.where(room_id: @room_id)
  end

  def show
    @user = User.find(params[:user_id])
    @room_id = message_room_id(current_user, @user)
    @messages = Message.where(room_id: @room_id)
  end

  private 

  def message_params
    params.permit(:content)
  end

  def message_room_id(first_user, second_user)
    first_id = first_user.id.to_i
    second_id = second_user.id.to_i
    if first_id < second_id
      "#{first_user.id}-#{second_user.id}"
    else
      "#{second_user.id}-#{first_user.id}"
    end
  end
end
