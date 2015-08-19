TODO:

Design Notes:
 - Tokens contain the username & the game to dynamically search for and play an instance of a game.
 - When requesting a play token, if a given username wasn't created prior, a new user will be created.
 - Games are pluggable and customizable based on text directions. I've included a Hangman game as an example.

Routes / API Endpoints

GET "/api/games/": Browse through all created games
GET "/api/users":  Browse through all players and their stats

POST "/api/games": Creates a new game with the given parameter, [title]
POST "/api/users": Creates a new user with the given parameter, [username]

POST "/api/new_game": Creates a new play token with the given parameters, [username, game title, duration]
POST "/api/play/:token": Creates a new turn with the given parameters, [token (within URL), directions (user input)]

Directions:

1. Create the database using: `bundle exec rake db:create db:migrate`

2. Get all users and stats: `curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users`

3. Create a new user using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"user": {"username":"sample_username"}}' http://localhost:3000/api/users`

4. Create a new game using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"game":{"title":"game_name"}}' http://localhost:3000/api/games`

5. Get a game play token using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"username":"username", "title": "game_title", "duration": 60}' http://localhost:3000/api/new_game`


curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"username":"sample_username", "title": "hangman", "duration": 60}' http://localhost:3000/api/new_game


curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"username":"sample_username", "title": "hangman", "duration":15}' http://localhost:3000/api/new_game

6. Play the game using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"directions": "guess x"}' http://localhost:3000/api/:play_token`

curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"directions": "guess x"}' http://localhost:3000/api/play/sample_username-1-reedyVwW79bV5xyZjRWZCA

Concerns:

1. Are game token timeouts determined by users or by the games themselves.
2. If usernames have a dash in the name, splits on incorrect params. (Solution: only allow letters/numbers)
