class AddEndTimeToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :end_time, :datetime
  end
end
