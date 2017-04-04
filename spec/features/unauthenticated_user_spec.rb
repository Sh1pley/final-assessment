require 'rails_helper'

describe "Unauthenticated User" do
  scenario "visits '/' path should be redirected" do
    visit '/'

    expect(page).to have_content("Please Log in")
    expect(page).to have_link("Sign Up")
  end

  scenario "click on Sign Up should take you to a new user form" do
    visit '/'
    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_form("Email Address")
    expect(page).to have_form("Password")
    expect(page).to have_form("Password Confirmation")
  end
end