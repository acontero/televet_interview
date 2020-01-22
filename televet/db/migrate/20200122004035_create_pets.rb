class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.integer :given_id
      t.string :name
      t.string :weight
      t.string :age
    end
  end
end
