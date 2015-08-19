module ApiController
  class UsersController < ApiController

    def create
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
