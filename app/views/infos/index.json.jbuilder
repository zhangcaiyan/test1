json.array!(@infos) do |info|
  json.extract! info, :name, :age, :desc, :tags
  json.url info_url(info, format: :json)
end
