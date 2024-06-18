# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Match friend profiles", system: true do
  it "displays profiles from connected users" do
    first_user = User.create!(email: "test@gmail.com", password: "123456")
    second_user = User.create!(email: "second@gmail.com", password: "123456")
    john = first_user.friend_profiles.create!(name: "John", description: "foo")
    second_user.friend_profiles.create!(name: "Kathi", description: "foo")
    second_user.friend_profiles.create!(name: "Woody", description: "foo")
    Connection.create!(from: first_user, to: second_user)

    login_as first_user, scope: :user

    visit friend_profile_path(john)

    expect(page).to have_content("John")
    expect(page).to have_content("Kathi")
    expect(page).to have_content("Woody")
  end
end
