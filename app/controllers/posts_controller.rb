class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@user = User.find_by_id(session[:current_user_id])

	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to root_url, notice: 'Topic Successfully Posted!'
		else
			render "new"
		end
	end

	def edit

	end

	def update

	end


	private

	def post_params
		params.require(:post).permit(:title,:body)
	end
end
