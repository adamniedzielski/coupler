# frozen_string_literal: true

class FriendProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend_profiles = FriendProfile.all
  end
end
