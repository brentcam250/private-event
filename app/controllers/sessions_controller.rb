class SessionsController < ApplicationController

    def new
        user = @user
        unless (user.nil?)
            session[:current_user_id] = user.id
            session[:current_user_name] = user.name
        else

        end
    end

    def create 
        session[:current_user_id] = @user.id
        session[:current_user_name] = @user.name
    end

    def destroy
        session[:current_user_id] = nil
        session[:current_user_name] = nil
    end

end