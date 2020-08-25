class UsersController < ApplicationController

    def index
    end 

    def new
    end 

    def create
        @user = User.create(user_params)
        if @user.save
            #binding.pry
            session[:user_id] = @user.id
            redirect_to '/'
        else
            redirect_to '/signup'
        end 
    end
     
    private
     
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 

end