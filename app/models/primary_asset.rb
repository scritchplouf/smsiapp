class PrimaryAsset < ActiveRecord::Base
  has_and_belongs_to_many :secondary_assets
end
