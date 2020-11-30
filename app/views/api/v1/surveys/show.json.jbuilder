json.data do
  json.extract! @survey, :id, :title, :created_at, :updated_at
  json.question do
    json.array! @survey.questions, :id, :title, :options, :created_at, :updated_at
  end
end
