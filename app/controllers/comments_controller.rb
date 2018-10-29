class CommentsController < ApplicationController


	def index
		@comment = Comment.all.order(created_at: 'desc')
	end

	def new
		@comment = Comment.new
	end

	def create
		@my_thread = MyThread.find(params[:my_thread_id])
		@my_thread.comments.create(comment_params)
		redirect_to my_thread_path(@my_thread)

	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to comment_path
		else
			render 'edit'
		end
	end

	def destroy
		@my_thread = Comment.find(params[:my_thread_id])
		@comment = @my_thread.comments.find(params[:id])
		@comment.destroy
		redirect_to my_thread_path(@my_thread)

	end

	private
		def comment_params
			params.require(:comment).permit(:text)
		end



end
