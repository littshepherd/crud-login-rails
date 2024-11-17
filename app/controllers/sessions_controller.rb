class SessionsController < ApplicationController
    skip_before_action :protect_pages
    def login
    end

    def authenticate
        respond_to do |format|
            @person = Person.find_by(username: params[:username])
            # puts "password: #{params[:password]}"
            # puts "auth: #{@person.authenticate(params[:password])}"
            # puts "Person: #{@person}"
            if @person && @person&.status && @person.authenticate(params[:password])
                session[:user_id] = @person.id
                format.html { redirect_to "/people", notice: "Bienvenido" }
            else
                @error = "Verificar usuario y contraseña"
                format.html { render :login, status: :unprocessable_entity }
                format.json { render json: { error: "Verificar usuario y contraseña" }, status: :unprocessable_entity }
            end
        end
    end
    def logout
        session[:user_id] = nil
        redirect_to "/login"
    end
end
