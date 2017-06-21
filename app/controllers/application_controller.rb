class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :current_user_is_following, :follow, :unfollow, :search

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def current_user_is_following(current_user_id, followed_user_id)
    relationship = Follow.find_by(follower_id: current_user_id, following_id: followed_user_id)
    return true if relationship
  end

  def follow(current_user_id, user_id)
    @f = Follow.new
    @f.follower = current_user_id
    @f.following = user_id
    @f.save
  end

  def unfollow( user_id)
    @f = Follow.find_by(following_id: user_id).destroy
  end

  def search()
    if params[:search]
      @recipes = Recipe.tagged_with(params[:search]).order("created_at DESC")
    end
  end
end
