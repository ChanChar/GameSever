Concerns:

1. Are game token timeouts determined by users or by the games themselves.

TODO:

Design Notes:
 - Multiple play tokens for continuous play on multiple games at a time.

Rough Draft of User Interface:

1. New user can create a new "account" or simply create a new game instance.
  a. Usernames can be created through requesting a game token.
  b. Username uniqueness checks on both model and db levels.

2. Browse through all Games by requesting games library at: "/api/games/"
3. Browse through all players and their stats by requesting users' index at: "/api/users"

Directions:

1. Create the database using: `bundle exec rake db:create db:migrate`
2. Get all users and stats: `curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users`
3. Create a new user using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"user": {"username":"sample_username"}}' http://localhost:3000/api/users`


curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"username":"new_iuser", "title": "hangman"}' http://localhost:3000/api/new_game
