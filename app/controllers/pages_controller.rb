class PagesController < ApplicationController
    def index
        if user_signed_in?
            redirect_to recipes_path
        else
            render 'pages/index'
        end
    end
end
