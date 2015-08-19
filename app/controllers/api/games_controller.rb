module Api
  class GamesController < ApiController

    def index
      @games = Game.all
    end

    def create
      # Originally decided to have token duration determined by game type.
      # @game = Game.new(title: params[:title].downcase, game_length: params[:game_length])

      @game = Game.new(title: params[:title].downcase)

      if @game.save
        message = {status: 200, message: "#{@game.title.capitalize} was successfully saved!"}
        render json: message
      else
        render json: @game.errors.full_messages, status: :unprocessable_entity
      end
    end

    # Game interface

    def play_turn
      @token = PlayToken.where("token: ?", params[:token])

      if PlayToken.valid_token?(@token)
        @player, @game = @token.split('-').slice(0, 1)
        message = { status: 200, message: @game.play_turn(params[:player_action]) }
        render json: message
      else
        message = { status: 403, message: "That token is invalid!" }
        render json: message
      end
    end

    private
      def game_params
        params.require(:game).permit(:title, :game_length)
      end
  end
end
