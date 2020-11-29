class AddReferenceSurvey < ActiveRecord::Migration[5.2]
  def change
    add_reference :surveys, :publisher, foreign_key: true
  end
end
