module Api
  class PlayTokensController < ApiController

    def create
      @user = User.find_by_username(params[:username])
      @game = Game.find_by_title(params[:title].downcase)
      @token_duration = params[:duration]

      if @user.nil?
        @user = User.create(username: params[:username])
      end

      if @game.nil?
        message = {status: 404, message: "#{params[:title].capitalize} was not found!"}
        render json: message
        return
      end

      # Originally had the game set the token expiration time
      # @expire_at = Time.now + @game.game_length.minutes

      @expire_at = Time.now + @token_duration.minutes
      @play_token = PlayToken.create(token: create_game_token(@user.username, @game.id), user_id: @user.id, game_id: @game.id, expire_at: @expire_at)

      message = {status: 200, message: "Hey, #{@user.username}, #{@game.title} is ready to go! You will be able to play until #{@play_token.expire_at}."}
      render json: message
    end
  end
end
