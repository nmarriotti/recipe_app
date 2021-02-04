class UsersController < ApplicationController
    def search
        @users = User.left_joins(:friend).where("email LIKE ?", "%" + params[:q] + "%")
        @friends = current_user.friend
    end
end
