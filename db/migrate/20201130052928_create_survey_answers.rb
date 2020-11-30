class CreateSurveyAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_answers do |t|
      t.references :survey_result, foreign_key: true
      t.references :question, foreign_key: true
      t.string :answer
    end
  end
end
