json.array!(@media) do |medium|
  json.extract! medium, :id, :title, :link
  json.url medium_url(medium, format: :json)
end
