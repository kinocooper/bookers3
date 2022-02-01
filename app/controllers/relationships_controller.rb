class RelationshipsController < ApplicationController

  def followers_index
    user = User.find(params[:user_id])
    @followers = user.followers
  end

  def followeds_index
    user = User.find(params[:user_id])
    @followeds = user.followeds
  end


  def create
    relationship = Relationship.new()
    relationship.follower_id = current_user.id
    relationship.followed_id = params[:user_id]
    relationship.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    relationship = Relationship.find_by(follower_id:current_user.id, followed_id:params[:user_id])
    relationship.destroy
    redirect_back(fallback_location: root_path)
  end

end
