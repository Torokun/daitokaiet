class SocialController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:follow, :unfollow]

  def index
  end

  def show
    @user = User.find_by(name: params[:name])
  end

  def search
    @users = User.where.not(id: current_user.id).search(params[:q]).result.sample(30)
  end

  def follow
    current_user.follow(@user)
  end

  def unfollow
    current_user.unfollow(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
