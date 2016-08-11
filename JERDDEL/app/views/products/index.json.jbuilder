json.array!(@products) do |product|
  json.extract! product, :id, :name, :sale_price, :purchase_price, :description, :use, :cantidad, :extension, :provider_id
  json.url product_url(product, format: :json)
end
