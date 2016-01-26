class CreateSecondaryAssets < ActiveRecord::Migration
  def change
    create_table :secondary_assets do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
