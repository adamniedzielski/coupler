# frozen_string_literal: true

class FriendProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend_profiles = current_user.friend_profiles
  end

  def show
    @friend_profile = current_user.friend_profiles.find(params[:id])
    @matched_profiles = (@friend_profile.outgoing_matched_profiles + @friend_profile.incoming_matched_profiles).uniq
    @profiles_for_matching = current_user.accessible_friend_profiles - @matched_profiles
  end

  def new
    @friend_profile = current_user.friend_profiles.build
  end

  def edit
    @friend_profile = current_user.friend_profiles.find(params[:id])
  end

  def create
    @friend_profile = current_user.friend_profiles.build(friend_profile_params)

    if @friend_profile.save
      redirect_to friend_profiles_url, notice: "Profile was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @friend_profile = current_user.friend_profiles.find(params[:id])

    if @friend_profile.update(friend_profile_params)
      redirect_to friend_profiles_url, notice: "Profile was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.friend_profiles.find(params[:id]).destroy
    redirect_to friend_profiles_url, notice: "Profile was successfully removed"
  end

  private

  def friend_profile_params
    params.require(:friend_profile).permit(:name, :description)
  end
end
