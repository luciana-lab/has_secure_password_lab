class UsersController < ApplicationController
    def new
        User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to controller: 'users', action: 'new'
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end