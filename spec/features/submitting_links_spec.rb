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
    expect(page).to have_field(:title)
    expect(page).to have_field(:url)
  end

  scenario "should be able to submit new links and see them" do
    visit root_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    fill_in :session_password_confirmation, with: @user.password
    click_on "Log in"
    fill_in :title, with: "Super Nice Link"
    fill_in :url, with: "https://turing.io"
    click_on "Add Link"

    link = Link.first

    expect(link.title).to eq("Super Nice Link")
    expect(link.url).to eq("https://turing.io")
    expect(page).to have_content("Super Nice Link")
    expect(page).to have_css("a", text: "https://turing.io")
  end
end