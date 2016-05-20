class CreatePlaydates < ActiveRecord::Migration
  def change
    create_table :playdates do |t|
      t.string   :group_name
      t.string   :location
      t.string   :meet_time
      t.integer  :creator_id

      t.timestamps null: false
    end
  end
end
#
