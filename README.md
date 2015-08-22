Notes:
 - Tokens contain the username & the game to dynamically search for and play an instance of a game.
 - When requesting a play token, if a given username wasn't created prior, a new user will be created.
 - Games are pluggable and customizable based on text directions. I've included a Hangman game as an example.
    - Games can be "plugged" under the lib/games directory.
    - Interaction with text based games are done through the `directions` parameter within the JSON request.
 - Tracks player statistics (win/loss/total), game statistics (player wins/computer wins/total)
 - Games, Users, PlayTokens, Turns Models
    - Where each instance of a Turn belongs to a PlayToken.

Routes / API Endpoints

GET "/api/games/": Browse through all created games

GET "/api/users":  Browse through all players and their stats

POST "/api/games": Creates a new game with the given parameter, [title]

POST "/api/users": Creates a new user with the given parameter, [username]

POST "/api/new_game": Creates a new play token with the given parameters, [username, game title, duration (in hours)]

POST "/api/play/:token": Creates a new turn with the given parameters, [token (within URL), directions (user input)]

Directions:

1. Create the database using: `bundle exec rake db:create db:migrate`

2. Run the server using: `rails server`

3. Get all users and stats: `curl -H "Content-Type: application/json" -X GET http://localhost:3000/api/users`

4. Create a new user using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"user": {"username":"sample_username"}}' http://localhost:3000/api/users`

5. Create a new game using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"game":{"title":"game_name"}}' http://localhost:3000/api/games`

6. Get a game play token using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"username":"username", "title": "game_title", "duration": 60}' http://localhost:3000/api/new_game`

7. Play the game using: `curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"directions": "guess x"}' http://localhost:3000/api/:play_token`

Example Gameplay:

1. Create hangman game
`curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"game":{"title":"hangman"}}' http://localhost:3000/api/games`

2. Request a play token
`curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"username":"sample_username", "title": "hangman", "duration": 2}' http://localhost:3000/api/new_game`

3. Play until player wins/losses or token times out
`curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d ' {"directions": "guess h"}' TOKEN_URL`

Post Notes:

1. Need better test coverage.
  - Run current specs using `bundle exec rspec spec`
2. Add more games!
3. Reformat JSON response for terminal.
