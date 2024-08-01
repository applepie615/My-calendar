class AddEndtimeToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :content, :text
  end
end
