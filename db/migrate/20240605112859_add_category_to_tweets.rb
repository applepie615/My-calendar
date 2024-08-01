class AddCategoryToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :category, :string
  end
end
