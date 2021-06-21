class UsersController < ApplicationController
    # before_action :authenticate_user!

    def check_user
        if user_signed_in?
            render json: current_user
        else
            render json: {}, :status => :ok
        end
    end
end