class PostsController < ApplicationController
    before_action :find_param, only: [:show,:update,:edit,:destroy,:upvote,:downvote]
    before_action :authenticate_user!, except: [:show,:index]

    def index
        @posts=Post.all.order("created_at DESC")
    end

    def show 
        @comments=Comment.where(post_id: @post)
    end

    def new
        @post = current_user.posts.build
    end
    
    def create
        @post= current_user.posts.build(create_params)
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
    
    def upvote
      @post.upvote_by current_user
      redirect_back(fallback_location: root_path)
    end

    def downvote
        @post.downvote_by current_user
        redirect_back(fallback_location: root_path)
    end

    private

    def find_param
        @post=Post.find(params[:id])
    end

    def create_params
    params.require(:post).permit(:link,:title,:description,:image)
    end


end
