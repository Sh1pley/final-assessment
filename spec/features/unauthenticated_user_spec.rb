require 'rails_helper'

describe "Unauthenticated User" do
  scenario "visits '/' path should be redirected" do
    visit '/'

    expect(page).to have_content("Please Log in")
    expect(page).to have_link("Register")
  end
end