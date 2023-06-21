class CommentsController < ApplicationController
    def create
        #byebug
        @content = Content.find(params[:comment][:commented_on_id])
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            flash[:notice] = "Comment was created successfully."
            redirect_to content_path(@content)
        else
            flash[:alert] = "Comment cann't be empty."
            redirect_to content_path(@content)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:note, :commented_on_id, :commented_on_type)
    end
end