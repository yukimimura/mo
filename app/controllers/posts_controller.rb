class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    @post = current_user.posts.build  # form_with 用
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '映画を投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '映画の投稿に失敗しました。'
      render 'posts/new'
    end
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      flash[:success] = '映画は正常に更新されました'
      redirect_to @post
    else
      flash.now[:danger] = '映画は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '映画を削除しました。'
    redirect_to root_url
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :image, :review, :content)
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
  
end
