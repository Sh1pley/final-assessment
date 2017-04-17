require 'rails_helper'

describe 'Editing Links', :js => :true do
  before :each do
    @user = User.create(email: "test@test.com", password: "1111")
    @user.links << Link.create(title: "test link", url: "https://testlink.com")
    visit root_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    click_on "Log in"
  end

  scenario 'clicking on Edit will take you to a page to edit the link' do
    click_on "Edit"

    expect(current_path).to eq('/links/1/edit')
  end

  scenario 'changing the title of the link, will update the title' do
    click_on "Edit"
    fill_in :title, with: "not a test link"
    click_on "Update Link"
    link = Link.first

    expect(page).to have_content("not a test link")
  end

  scenario 'changing the url of the link, updates the url' do
    click_on "Edit"
    fill_in :url, with: "https://not.test.com"
    click_on "Update Link"
    link = Link.first

    expect(page).to have_content("https://not.test.com")
  end
end