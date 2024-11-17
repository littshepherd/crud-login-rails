class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :middle_name
      t.string :last_name
      t.string :second_last_name
      t.string :address
      t.string :phone
      t.string :email
      t.string :username
      t.string :password_digest
      t.boolean :status
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
