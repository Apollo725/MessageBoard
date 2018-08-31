class CommentsController < ApplicationController
before_action :find_params, only:[:create, :edit, :destroy]

  def create 
    @comment = @message.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to message_path(@message)
    else
      render 'new'
    end
  end

  def edit
    @comment = @message.comments.find(params[:id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to message_path(@messge)
    else
      render 'edit'
    end
  end
  
  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:context)
    end
    def find_params
       @message = Message.find(params[:message_id])
    end

end
