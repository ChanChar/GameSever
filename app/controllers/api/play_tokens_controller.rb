require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

module Api
  class PlayTokensController < ApiController

    def create
      @user = User.find_by_username(params[:username])
      @game = Game.find_by_title(params[:title].downcase)
      @token_duration = params[:duration]

      if @user.nil?
        @user = User.create(username: params[:username])
      else
        @user.invalidate_last_token
      end

      if @game.nil?
        message = {status: 404, message: "#{params[:title].capitalize} was not found!"}
        render json: message
        return
      end

      @expire_at = Time.now + @token_duration.hours
      @token = PlayToken.create_game_token(@user.username, @game.id)
      @play_token = PlayToken.new(token: @token, user_id: @user.id, game_id: @game.id, expire_at: @expire_at)

      if @play_token.save
        message = {
          status: 200, message: "Hey, #{@user.username}, #{@game.title.capitalize} is ready to go! You will be able to play for #{time_ago_in_words(@play_token.expire_at)}. You can play using the following url: #{api_play_game_url(@play_token.token)}"
        }
      else
        message = { status: 403, message: "Something is wrong with the token generator. Contact me at charleschanlee@gmail.com." }
      end
      render json: message
    end
  end
end
