class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.float :x, index: true
      t.float :y, index: true

      t.timestamps null: false
    end
  end
end
