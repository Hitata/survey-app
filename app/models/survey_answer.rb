class SurveyAnswer < ApplicationRecord
  belongs_to :survey_result
  belongs_to :question
end
