class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :title
      t.boolean :active, :null => false, :default => false

      t.timestamps
    end
  end
end
