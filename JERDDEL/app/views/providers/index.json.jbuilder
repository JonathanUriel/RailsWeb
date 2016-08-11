json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :phone, :street, :colony, :number, :state_id
  json.url provider_url(provider, format: :json)
end
