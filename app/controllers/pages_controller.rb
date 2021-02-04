class PagesController < ApplicationController
    def index
        if user_signed_in?
            render 'main/index'
        else
            render 'pages/index'
        end
    end
end
