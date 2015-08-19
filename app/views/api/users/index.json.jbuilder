json.user_stats do
  json.array!(@users) do |user|
    json.partial! 'api/users/user', user: user
  end
end
