json.array!(@devices) do |device|
  json.extract! device, :name, :status
  json.url device_url(device, format: :json)
end
