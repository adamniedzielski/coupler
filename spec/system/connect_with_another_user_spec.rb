# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Connect with another user", system: true do
  it "sends a connection request" do
    first_user = User.create!(email: "test@gmail.com", password: "123456")
    second_user = User.create!(email: "second@gmail.com", password: "123456")

    login_as first_user, scope: :user

    visit users_path

    expect(page).to have_content("second@gmail.com")

    click_on "Connect"

    expect(page).to have_content("Connection request was sent")
    expect(page).to have_content("second@gmail.com Sent")

    login_as second_user, scope: :user

    visit users_path

    expect(page).to have_content("test@gmail.com")

    click_on "Accept"

    expect(page).to have_content("You are now connected")
    expect(page).to have_content("test@gmail.com Connected")
  end
end
