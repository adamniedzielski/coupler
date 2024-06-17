# frozen_string_literal: true

class FriendProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend_profiles = current_user.friend_profiles
  end

  def new
    @friend_profile = current_user.friend_profiles.build
  end

  def create
    @friend_profile = current_user.friend_profiles.build(friend_profile_params)

    if @friend_profile.save
      redirect_to friend_profiles_url, notice: "Profile was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def friend_profile_params
    params.require(:friend_profile).permit(:name, :description)
  end
end
