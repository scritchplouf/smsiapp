class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :primary_assets, :secondary_assets do |t|
       t.index [:primary_asset_id, :secondary_asset_id], name: "pa_sa_id"
       t.index [:secondary_asset_id, :primary_asset_id], name: "sa_pa_id"
    end
  end
end
