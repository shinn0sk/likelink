class GoodsController < ApplicationController
    before_action :good_setup

    def create
        @good = Good.create(user_id: current_user.id, post_id: params[:post_id])
        @goods = Good.where(post_id: params[:post_id])
        @posts = Post.all
        @post.reload
    end

    def destroy
        
        @good = Good.find_by(user_id: current_user.id, post_id: params[:post_id])
        @good.destroy
        @goods = Good.where(post_id: params[:post_id])
        @posts = Post.all
        @post.reload
    end


    private
    def good_setup
        @post = Post.find(params[:post_id])
    end

end
