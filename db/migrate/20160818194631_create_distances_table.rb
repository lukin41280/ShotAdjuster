class CreateDistancesTable < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.string :yards
      t.integer :club_id

      t.timestamps
    end
  end
end
