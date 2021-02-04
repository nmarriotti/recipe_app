class MainController < ApplicationController
    def index
      redirect_to recipes_path
    end

    def search
        @users = User.where("email LIKE ?", "%" + params[:q] + "%")
      end
end