class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :options, array: true
      t.references :survey, foreign_key: true

      t.timestamps
    end

    add_index :questions, :options, using: 'gin'
  end
end
