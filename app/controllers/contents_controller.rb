class ContentsController < ApplicationController
    before_action :set_content, only: [ :show, :edit, :update, :destroy ]

    def index
        @contents = Content.all
    end

    def show
        @subcontents = Content.where(id: @content.attached_contents)
        @comments = @content.comments
    end

    def new
        @content = Content.new
        @userscontents = current_user.contents
    end

    def edit
        @userscontents = current_user.contents
    end

    def create
        @userscontents = current_user.contents
        @content = Content.new(content_params)
        if @content.valid?
            @content.users << current_user
            @content.attached_contents = params[:content][:attached_contents]
        end

        if @content.save
            flash[:notice] = "Content was created successfully."
            redirect_to @content
        else
            render :new
        end
    end

    def update
        @userscontents = current_user.contents
        if @content.valid?
            @content.users << current_user
            @content.attached_contents = params[:content][:attached_contents]
        end

        if @content.update(content_params)
            
            flash[:notice] = "Content was updated successfully."
            redirect_to @content
        else
            render :edit
        end
    end

    def destroy
        @content.destroy
        redirect_to contents_path
    end

    private
    
    def set_content
        @content = Content.find(params[:id])
    end

    def content_params
        params.require(:content).permit(:title, :description, :attached_contents, user_ids: [])
    end

end