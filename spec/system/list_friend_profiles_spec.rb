# frozen_string_literal: true

require "rails_helper"

RSpec.describe "List friend profiles", system: true do
  it "displays profiles scoped to the current user" do
    first_user = User.create!(email: "test@gmail.com", password: "123456")
    second_user = User.create!(email: "second@gmail.com", password: "123456")
    first_user.friend_profiles.create!(name: "John", description: "foo")
    first_user.friend_profiles.create!(name: "Kathi", description: "foo")
    second_user.friend_profiles.create!(name: "Woody", description: "foo")

    login_as first_user, scope: :user

    visit friend_profiles_path

    expect(page).to have_content("John")
    expect(page).to have_content("Kathi")
    expect(page).to have_no_content("Woody")
  end
end
