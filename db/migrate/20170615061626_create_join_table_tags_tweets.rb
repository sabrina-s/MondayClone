class CreateJoinTableTagsTweets < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tweets, :tags do |t|
      t.references :tweet, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
