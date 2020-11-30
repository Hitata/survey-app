class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.string :email, :null => false
      t.references :survey, foreign_key: true
    end

    add_index :survey_results, :email, unique: true
  end
end
