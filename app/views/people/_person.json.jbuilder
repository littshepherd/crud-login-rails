json.extract! person, :id, :name, :middle_name, :last_name, :second_last_name, :address, :phone, :email, :username, :password_digest, :status, :role_id, :created_at, :updated_at
json.url person_url(person, format: :json)
