class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.integer :points
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
