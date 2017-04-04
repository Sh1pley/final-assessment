require 'rails_helper'

describe "Authenticated User" do
  before :all do
    @user = User.create(email: "test@test.com", password: "1234")
  end
  scenario "as a registered user I should see a successful log in message" do
    visit login_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    fill_in :session_password_confirmation, with: @user.password
    click_on "Log in"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Come on in")
  end
end