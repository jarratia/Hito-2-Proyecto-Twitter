class Tweet < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :tweets
  has_many :tags

  scope :content, -> (content) { where("content LIKE ?", "%#{content}%") }

end
