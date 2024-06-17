# frozen_string_literal: true

class FriendProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend_profiles = current_user.friend_profiles
  end
end
