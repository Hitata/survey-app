json.data do
  json.extract! @survey, :id, :title, :created_at, :updated_at
end
