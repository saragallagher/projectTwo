class RelationshipsController < ApplicationController



  def follow_user
    @user = User.find(params[:id])

    if follow(current_user, @user)
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
    end
  end

  def unfollow_user

    @user = User.find(params[:id])

    if unfollow(@user.id)
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
    end
  end
end
