class MainController < ApplicationController 
    def index
        flash.now[:notice] = "Logged in successfully" #flash with .now persists 1 time 
        flash.now[:alert] = "Invalid email or password"
    end
end