class TimelinesController < ApplicationController
  def index
    if logged_in?
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page])
    else
      redirect_to root_path
    end
  end
end
