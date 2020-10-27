class SessionsController < ApplicationController

    def new
        reset_session
        @user = User.find(params[:id])
        
        unless (user.nil?)
            session[:current_user_id] = user.id
            session[:current_user_name] = user.name
            session[:current_user] = user
        else

        end
        redirect_to '/events/new'
    end

    def create 
        # session[:current_user_id] = @user.id
        # session[:current_user_name] = @user.name
    end

    def destroy
        reset_session
    end

end