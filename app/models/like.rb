class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def to_s
    user_id
  end
end
