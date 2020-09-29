class PostsController < ApplicationController
    before_action :find_param, only: [:show,:update,:edit,:destroy]
    def index
        @posts=Post.all.order("created_at DESC")
    end

    def show 
    end

    def new
        @post = Post.new
    end
    
    def create
        @post=Post.new(create_params)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def update
        if @post.update(create_params)
          redirect_to @post            
        else
            render 'edit'
        end

    end

    def edit 
    end
    
    def destroy
        @post.destroy
        redirect_to root_path
    end

    private

    def find_param
        @post=Post.find(params[:id])
    end

    def create_params
    params.require(:post).permit(:link,:title,:description)
    end


end
