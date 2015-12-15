class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:current_user_id] = user.id
			redirect_to profile_path, notice: "Login Successful! Welcome to your profile"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:current_user_id] = nil
		redirect_to root_url, notice: "Log out Successful"
	end
end
