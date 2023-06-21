class FeedbacksController < ApplicationController
    def create
        #byebug
        @content = Content.find(params[:feedback][:feedback_on_id])
        @feedback = Feedback.new(feedback_params)
        @feedback.user_id = current_user.id

        if @feedback.save
            flash[:notice] = "Feedback was created successfully."
            redirect_to content_path(@content)
        else
            flash[:alert] = "Feedback cann't be empty."
            redirect_to content_path(@content)
        end
    end

    private
    def feedback_params
        params.require(:feedback).permit(:info, :feedback_on_id, :feedback_on_type)
    end
end