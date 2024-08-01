class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :thing
      t.date :date_date
      t.time :date_time
      t.text :address

      t.timestamps
    end
  end
end
