json.data do
  json.array! @surveys, :id, :title, :created_at, :updated_at
end
