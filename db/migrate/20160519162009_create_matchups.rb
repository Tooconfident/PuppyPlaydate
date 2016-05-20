class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.belongs_to :dog, index: true
      t.belongs_to :playdate, index: true

      t.timestamps null: false
    end
  end
end
