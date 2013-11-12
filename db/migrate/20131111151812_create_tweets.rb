class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :twitteruser
      t.string :text
      t.timestamps
    end
  end
end
