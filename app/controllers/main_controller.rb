class MainController < ApplicationController
    def index
    end

    def search
        @users = User.where("email LIKE ?", "%" + params[:q] + "%")
      end
end