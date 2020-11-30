class CreateSurveyResults < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_results do |t|
      t.string :email, :null => false
      t.references :survey, foreign_key: true

      t.timestamps
    end

    add_index :survey_results, :email
  end
end
