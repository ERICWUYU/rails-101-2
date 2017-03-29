class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts
  end

  def edit
    @post = Post.find(params[:group_id])
  end

  def update
    @post = Post.find(params[:group_id])
    if @post.update(post_params)
      redirect_to account_posts_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:group_id])
    @post.destroy
    redirect_to account_posts_path, alert: "Post deleted"
  end
end
