# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create friend profile", system: true do
  it "stores the data" do
    user = User.create!(email: "test@gmail.com", password: "123456")

    login_as user, scope: :user

    visit friend_profiles_path

    click_on "Create new profile"
    fill_in "Name", with: "Edward"
    fill_in "Description", with: "Foo"
    click_on "Create"

    expect(page).to have_content "Profile was successfully created"
    expect(page).to have_content "Edward"
  end
end
