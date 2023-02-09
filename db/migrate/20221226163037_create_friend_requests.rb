class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.belongs_to :sent_by, foreign_key: { to_table: :users }
      t.belongs_to :sent_to, foreign_key: { to_table: :users }
      t.string :status, default: 'requested'
      t.timestamps
    end
  end
end
