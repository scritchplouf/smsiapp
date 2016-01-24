json.array!(@primary_assets) do |primary_asset|
  json.extract! primary_asset, :id, :name, :description, :d, :i, :c, :t
  json.url primary_asset_url(primary_asset, format: :json)
end
