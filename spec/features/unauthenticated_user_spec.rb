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
    expect(page).to have_field(:user_email)
    expect(page).to have_field(:user_password)
    expect(page).to have_field(:user_password_confirmation)
  end

  scenario "should not be able to sign up with just an email" do
    visit '/'
    click_on "Sign Up"
    fill_in :user_email, with: "j@j.com"
    click_on "Sign Up"

    expect(page).to have_content("Password can't be blank,")
  end
end