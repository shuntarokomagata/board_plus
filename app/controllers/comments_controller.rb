class CommentsController < ApplicationController


	def index
		@my_thread = MyThread.find(params[:my_thread_id])
		@comment = Comment.where(my_thread_id: @my_thread.id).order(created_at: 'desc')
	end

	def new
		@comment = Comment.new
	end

	def create
		@my_thread = MyThread.find(params[:my_thread_id])
		@comment = Comment.new(comment_params)
		@comment[:my_thread_id] = @my_thread.id
		if @comment.save
			redirect_to	my_thread_comments_path
		else
			render 'new'
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to	my_thread_comments_path
		else
			render 'edit'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to my_thread_comments_path

	end

	private
		def comment_params
			params.require(:comment).permit(:text, :my_thread_id)
		end



end
