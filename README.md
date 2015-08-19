TODO:

1. Add indexes to games titles
2. Add uniqueness constraint to users

2. Multiple play tokens for continuous play on multiple games at a time.


Rough Draft of User Interface:

1. New user can create a new "account" or simply create a new game instance.
  a. Usernames can be created through requesting a game token.
  b. Username uniqueness checks on both model and db levels.

2. Browse through all Games by requesting games library at: "/api/games/"
3. Browse through all players and their stats by requesting users' index at: "/api/users"



Directions:

1. Create the database using: `bundle exec rake db:create db:migrate`
2. Get all users and stats: `curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users`
