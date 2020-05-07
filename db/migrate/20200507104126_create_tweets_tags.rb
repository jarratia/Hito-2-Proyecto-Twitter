class CreateTweetsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets_tags, :id => false do |t|
      t.references :Tweet, foreign_key: true
      t.references :Tag, foreign_key: true
    end
  end
end
