class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find_by(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find_by(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
