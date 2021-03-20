class PostsController < ApplicationController

    before_action :authenticate_admin!, except: [:index, :show]
    
    def index
        @posts = Post.order(:id)
        render :index
    end
    
    def show
        @post = Post.find_by_slug(params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(params.require(:post).permit(:title, :body, :description))

        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def edit
        @post = Post.find_by_slug(params[:id])
        render :edit
    end

    def update
        @post = Post.find_by_slug(params[:id])
        if @post.update(params.require(:post).permit(:title, :body, :description))
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find_by_slug(params[:id])
        @post.destroy
        redirect_to posts_url
    end
    
end
