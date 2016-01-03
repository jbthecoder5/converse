class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		
		if @post.comments.create(comment_params)
			redirect_to @post,
						notice: 'Your comment was successfully added'
		else
			redirect_to @post, 
						alert: 'Error posting comment'
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:author, :body)
	end
end
