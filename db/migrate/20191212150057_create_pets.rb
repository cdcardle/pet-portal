class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :animal_type
      t.string :breed
      t.string :gender
      t.string :color
      t.integer :weight
      t.integer :age

      t.timestamps
    end
  end
end
