class Tweet < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :tweets
  has_and_belongs_to_many :tags

  scope :content, -> (content) { where("content LIKE ?", "%#{content}%") }

  # def to_s
  #   name
  # end

end
