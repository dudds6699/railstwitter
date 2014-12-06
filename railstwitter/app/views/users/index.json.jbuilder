json.array!(@users) do |user|
  json.extract! user, :id, :name, :phonenumber, :age, :birthday
  json.url user_url(user, format: :json)
end
