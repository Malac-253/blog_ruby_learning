class BlogPostsController < ApplicationController

  before_action :set_blog_post, only: [:show, :edit, :update, :destroy] # or except: [:index, :new, :create]

  def index
    @blog_posts = BlogPost.all
  end

  def show

  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: "Blog post created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: "Blog post updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to all_blog_posts, notice: "Blog post deleted successfully"
  end

private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to all_blog_posts, alert: "Blog post not found"
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end

end