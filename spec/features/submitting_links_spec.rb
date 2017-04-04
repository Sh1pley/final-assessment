require 'rails_helper'

describe "as a User, when logged in" do
  before do
    @user = User.create(email: "test@testy.com", password: "1111")
  end
  scenario "should see a form to submit links" do
    visit root_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    fill_in :session_password_confirmation, with: @user.password
    click_on "Log in"

    expect(current_path).to eq('/')
    expect(page).to have_field(:link_title)
    expect(page).to have_field(:link_url)
  end
end