class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers, :likes, :search]
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
  end
  
  def likes
    @user = User.find(params[:id])
    @myfavorites = @user.myfavorites.page(params[:page])
  end
  
  def usersearch
    if params[:name].present? 
      @users = User.where('name LIKE ?', "%#{params[:name]}%").page(params[:page])
    else
      @users = User.none.page(params[:page])
    end
  end
  
  def postsearch
    if params[:title].present?
      @posts = Post.where('title LIKE ?', "%#{params[:title]}%").page(params[:page])
    else
      @posts = Post.none.page(params[:page])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
