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

   scenario "should not be able to sign up without confirming password" do
    visit '/'
    click_on "Sign Up"
    fill_in :user_email, with: "j@j.com"
    fill_in :user_password, with: '1234'
    click_on "Sign Up"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario "should be able to sign up with email and confirmed password" do
    visit '/'
    click_on "Sign Up"
    fill_in :user_email, with: "j@j.com"
    fill_in :user_password, with: '1234'
    fill_in :user_password_confirmation, with: '1234'
    click_on "Sign Up"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome")
  end
end