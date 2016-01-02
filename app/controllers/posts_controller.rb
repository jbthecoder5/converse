class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@user = User.find_by_id(session[:current_user_id])
	end

	def show
		@post = Post.find(params[:id])
		@user = User.find_by_id(session[:current_user_id])
	end

	def find
		@posts = Post.where("title = ? OR body = ?",
			params[:search_string], params[:search_string])
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to root_url, notice: 'Topic Successfully Posted!'
		else
			render "new"
		end
	end

	def show_user_posts
		@users = User.find(params[:id])
		if(@users.exist?)
			if(@users.find_by_id(:current_user_id)) 

			end
		end

	end

	def destroy_user_posts
		@user = User.find(params[:id])
		if(@user.exist? == false)
			@user.posts.destroy 
		end

		
	end

	private

	def post_params
		params.require(:post).permit(:title,:body)
	end
end
