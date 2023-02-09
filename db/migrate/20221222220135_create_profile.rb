class CreateProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :name
      t.string :location
      t.date :birthday
      t.timestamps
    end
  end
end
