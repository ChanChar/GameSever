module Api
  class GamesController < ApiController

    def index
      @games = Game.all
    end

    def create

      @game = Game.new(game_params)
      @game.title = @game.title.downcase

      if @game.save
        message = {status: 200, message: "#{@game.title.capitalize} was successfully saved!"}
      else
        message = { status: :unprocessable_entity, message: @game.errors.full_messages }
      end

      render json: message
    end

    # Game interface

    def play_turn
      @token = PlayToken.find_by_token(params[:token])

      if @token && @token.valid_token?
        @player, @game_id = @token.token.split('-').slice(0, 2)
        @current_turn = Turn.create(play_token_id: @token.id, directions: params[:directions])

        @game = Game.find(@game_id).title
        current_game = @game.classify.constantize.new(@token.value)

        if @token.value.nil?
          @token.update(value: current_game.mystery_word)
        end

        @token.turns.each do |turn|
          current_game.play_turn(turn.directions)
        end

        if current_game.won?
          @token.mark_complete(true)
          message = { status: 200, message: "YOU WON!" }
        elsif current_game.lost?
          @token.mark_complete
          message = { status: 200, message: "YOU LOST..." }
        else
          message = { status: 200, message: current_game.current_state }
        end

        render json: message
      else
        message = { status: 403, message: "That token is invalid!" }
        render json: message
      end
    end

    private
      def game_params
        params.require(:game).permit(:title)
      end
  end
end
