class UsersController < ApplicationController	
	def index
		@users = User.all
		@posts = Post.all
	end

	def show
		@users = User.all
	end

=begin 
	// The purpose of this method is to find created post of the user
	However, I'am having trouble doing this and will look for an alternative solution.
	
	def posts
	    @user = User.find(params[:id]
	    @posts = @user.posts
	end
=end 

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to root_url, notice: "Welcome to the site"
		else
			render "new"
		end
	end

	def edit
		@user = User.find_by_id(session[:current_user_id])
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params.require(:user).permit(:name,:email,:password))

		if @user.save
			redirect_to root_url, notice: 'Your account has been updated'
		else
			render "profile"
		end
	end

	def destroy
		@user = User.find_by_id(session[:current_user_id]).destroy
		session[:current_user_id] = nil
		redirect_to root_url, notice: 'Account successfully deactivated, you will be missed :('
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
									 :password_confirmation)
	end
end
