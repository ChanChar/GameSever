module Api
  class GamesController < ApiController
    before_action :check_play_token

    def create
      @game = Game.new(params[:title].downcase)
      if @game.save
        message = {status: 200, message: "#{@game.title.capitalize} was successfully saved!"}
        return json: message
    end

    def start_game
      @user = User.find_by_username(params[:username])
      @game = Game.find_by_title(params[:title].downcase)

      if @user.nil?
        @user = User.create(username: @user.username)
      end

      if @game.nil?
        message = {status: 404, message: "#{params[:title].capitalize} was not found!"}
        render json: message
      end

      @expire_at = Time.now + @game.game_length.minutes
      @play_token = PlayToken.create(token: create_game_token(@user.username, @game.id),
                                     user_id: @user.id, game_id: @game.id, expire_at: @expire_at)

      message = {status: 200, message: "Hey, #{@user.username}, #{@game.title} is ready to go! You will be able to play until #{@play_token.expire_at}."
      render json: message
    end

    def play_turn
      # TODO
    end

    protected
      def check_play_token
        # TODO
      end

    private
      def game_params
        params.require(:game).permit(:title)
      end
  end
end
