class AddColorToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :color, :string
  end
end
