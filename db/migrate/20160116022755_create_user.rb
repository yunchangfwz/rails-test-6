class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.references :father, index: true
      t.references :mother, index: true
      t.timestamp
    end
  end
end
