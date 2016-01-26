class CreatePrimaryAssets < ActiveRecord::Migration
  def change
    create_table :primary_assets do |t|
      t.string :name
      t.string :description
      t.integer :d
      t.integer :i
      t.integer :c
      t.integer :t

      t.timestamps null: false
    end
  end
end
