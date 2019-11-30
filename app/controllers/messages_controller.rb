class MessagesController < ApplicationController
  def index 
    # 現在のユーザーが所属しているルームリスト
    @rooms = []
    # 現在のユーザーがメッセージしたことある相手リスト
    @users = []

    #first_userが現在のユーザーの場合
    if Room.where(first_user_id: current_user.id).present?
      tmp_rooms = Room.where(first_user_id: current_user.id)
      @rooms.push(tmp_rooms)
      #ルームから相手のユーザーを探す
      tmp_rooms.each do |tmp_room|
        tmp_users = User.where(id: tmp_room.second_user_id)
        tmp_users.each do |tmp_user|
          @users.push(tmp_user)
        end
      end
    end
    #second_userが現在のユーザーの場合
    if Room.where(second_user_id: current_user.id).present?
      tmp_rooms = Room.where(second_user_id: current_user.id)
      @rooms.push(tmp_rooms)
      #ルームから相手のユーザーを探す
      tmp_rooms.each do |tmp_room|
        tmp_users = User.where(id: tmp_room.first_user_id)
        tmp_users.each do |tmp_user|
          @users.push(tmp_user)
        end
      end
    end

    #初期表示用
    @user = @users[0]

    current_user_id = current_user.id
    another_user_id = @user.id

    @messages = Message.new().find_messages(current_user_id, another_user_id)
  end

  def new
    @message = Message.new
    @user = params[:user_id]
  end

  def create
    # roomを作成する
    current_user_id = current_user.id
    another_user_id = params[:user_id].to_i

    first_user_id = min_user_id(current_user_id, another_user_id)
    second_user_id = max_user_id(current_user_id, another_user_id)

    #roomが無ければ作成
    unless Room.find_by(first_user_id: first_user_id, second_user_id: second_user_id).present?
      room = Room.new(first_user_id: first_user_id, second_user_id: second_user_id)
      room.save!
    else
      room = Room.find_by(first_user_id: first_user_id, second_user_id: second_user_id)
    end
    
    # messageを作成
    @message = Message.new(message_params)
    @message.from_id = current_user.id
    @message.to_id = params[:user_id]
    @message.room_id = room.id
    @message.save!
    @messages = Message.where(room_id: @message.room_id)
  end

  def show
    current_user_id = current_user.id
    another_user_id = params[:user_id].to_i

    @messages = Message.new().find_messages(current_user_id, another_user_id)
    @user = User.find(params[:id])

    # ajaxの場合はindex.html.erb
    if request.xhr?
      user_messages_path
    end
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

  def min_user_id(first_user, second_user)
    if first_user < second_user
      first_user
    else
      second_user
    end
  end

  def max_user_id(first_user, second_user)
    if first_user < second_user
      second_user
    else
      first_user
    end
  end
end
