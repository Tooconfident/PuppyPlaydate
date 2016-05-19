class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :age
      t.string :temperment
      t.integer :user_id
      t.timestamps
    end
  end
end

