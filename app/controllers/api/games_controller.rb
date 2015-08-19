module Api
  class GamesController < ApiController
    before_action :check_play_token

    def create
      @game = Game.new(params[:title].downcase)
      if @game.save
        message = {status: 200, message: "#{@game.title.capitalize} was successfully saved!"}
        return json: message
    end

    def create_token
      @user = User.find_by_username(params[:username])
      @game = Game.find_by_title(params[:title].downcase)

      if @user.nil?
        @user = User.create(username: @user.username)
      end

      if @game.nil?
        message = {status: 404, message: "#{params[:title].capitalize} was not found!"}
        render json: message
      end
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
