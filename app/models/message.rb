class Message < ApplicationRecord
  # Scopes
  default_scope -> {order(created_at: :asc)}

  # Validations
  validates :from_id, presence: true
  validates :to_id, presence: true
  validates :room_id, presence: true
  validates :content, presence: true, length: {maximum: 50}

  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  belongs_to :room

  def find_messages(current_user_id, another_user_id)
    first_user_id = min_user_id(current_user_id, another_user_id)
    second_user_id = max_user_id(current_user_id, another_user_id)

    if room = Room.find_by(first_user_id: first_user_id, second_user_id: second_user_id)
      return messages = Message.where(room_id: room.id)
    else
      return messages = []
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
