class SessionsController < ApplicationController

    def new
        @user = User.first
        user = @user
        unless (user.nil?)
            session[:current_user_id] = user.id
            session[:current_user_name] = user.name
            session[:current_user] = user
        else

        end
        # redirect_to 'events#new' event_path
    end

    def create 
        # session[:current_user_id] = @user.id
        # session[:current_user_name] = @user.name
    end

    def destroy
        session[:current_user_id] = nil
        session[:current_user_name] = nil
    end

end