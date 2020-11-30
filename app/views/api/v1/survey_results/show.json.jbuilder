json.data do
  json.extract! @result, :email, :created_at, :updated_at
  json.answers do
    json.array! @result.survey_answers do |answer|
      json.id answer.id
      json.question_title answer.question.title
      json.answer answer.answer
      json.created_at answer.created_at
      json.updated_at answer.updated_at
    end
  end
end
