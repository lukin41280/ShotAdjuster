class CreateClubsTable < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.integer :golfer_id

      t.timestamps
    end
  end
end
