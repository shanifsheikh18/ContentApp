class ContentsController < ApplicationController
    before_action :set_content, only: [ :show, :edit, :update, :destroy ]

    def index
        @contents = Content.all
    end

    def show
        
    end

    def new
        @content = Content.new
    end

    def edit
       
    end

    def create
        @content = Content.new(content_params)
        if @content.save
            flash[:notice] = "Content was created successfully."
            redirect_to @content
        else
            render :new
        end
    end

    def update
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
        params.require(:content).permit(:title, :description)
    end

end