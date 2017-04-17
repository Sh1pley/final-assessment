require 'rails_helper'

describe "as a User, when logged in", :js => :true do

  it "should see a form to submit links" do
    @user = User.create(email: "test@testy.com", password: "1111")
    visit root_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    click_on "Log in"
    expect(current_path).to eq('/')
    expect(page).to have_field(:title)
    expect(page).to have_field(:url)
  end

  it "should be able to submit new links and see them" do
    @user = User.create(email: "test@testy.com", password: "1111")
    visit root_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    click_on "Log in"
    fill_in :title, with: "Super Nice Link"
    fill_in :url, with: "https://turing.io"
    save_and_open_page
    click_on "Add Link"

    expect(page).to have_css("a", text: "turing.io..")
    expect(page).to have_css("alert", text: "Super Nice Link added.")
  end
end