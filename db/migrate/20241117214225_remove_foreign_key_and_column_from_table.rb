class RemoveForeignKeyAndColumnFromTable < ActiveRecord::Migration[8.0]
  def change
    # remove_foreign_key :person, :role

    # remove_column :person, :role_id

    remove_reference :people, :role, foreign_key: true
    remove_column :people, :role_id
  end
end
