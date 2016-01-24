json.array!(@secondary_assets) do |secondary_asset|
  json.extract! secondary_asset, :id, :name, :description
  json.url secondary_asset_url(secondary_asset, format: :json)
end
