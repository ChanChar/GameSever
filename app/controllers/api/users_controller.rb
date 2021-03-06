module Api
  class UsersController < ApiController

    def index
      @users = User.includes(:play_tokens).all
    end

    def create
      puts params
      @user = User.new(user_params)

      if @user.save
        message = { status: 200, message: "User #{@user.username} was successfully created!" }
        render json: message
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:username)
    end
  end
end
