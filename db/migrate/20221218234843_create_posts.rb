class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :content
      t.timestamps
    end
  end
end
