json.data do
  json.array! @surveys do |survey|
    json.id survey.id
    json.title survey.title
    json.publisher_name survey.publisher&.name
  end
end
