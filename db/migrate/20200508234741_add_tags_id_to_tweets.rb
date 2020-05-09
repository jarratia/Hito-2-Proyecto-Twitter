class AddTagsIdToTweets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :tags, foreign_key: true
  end
end
