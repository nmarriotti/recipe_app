class UsersController < ApplicationController

    def search
        if params[:q] != ""
            @users = User.left_joins(:friend).where("email LIKE ?", "%" + params[:q] + "%")
            @friends = current_user.friend
        end
    end
end
