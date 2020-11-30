json.data do
  json.extract! @result, :email, :created_at, :updated_at
  json.answers do
    json.array! @result.survey_answers, :id, :question_id, :answer, :created_at, :updated_at
  end
end
