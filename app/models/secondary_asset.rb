class SecondaryAsset < ActiveRecord::Base
  has_and_belongs_to_many :primary_assets
end
