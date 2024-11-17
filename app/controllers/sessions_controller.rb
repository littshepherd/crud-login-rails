class SessionsController < ApplicationController
    skip_before_action :protect_pages
    def login
    end

    def authenticate
        @person = Person.find_by(username: params[:username])
        # puts "password: #{params[:password]}"
        # puts "auth: #{@person.authenticate(params[:password])}"
        # puts "Person: #{@person}"
        if @person && @person&.status && @person.authenticate(params[:password])
            session[:user_id] = @person.id
            redirect_to "/people"
        else
            redirect_to "/login"
        end
    end
    def logout
        session[:user_id] = nil
        redirect_to "/login"
    end
end
