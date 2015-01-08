class CreateVoteModel < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :topic_id
    end
  end
end
