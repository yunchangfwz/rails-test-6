class CreateFathers < ActiveRecord::Migration
  def change
    create_table :fathers do |t|

      t.timestamps null: false
    end
  end
end
