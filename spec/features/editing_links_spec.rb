require 'rails_helper'

describe 'Editing Links' do
  before do
    @user = User.create(email: "test", password: "1111")
    @user.links << Link.create(title: "test link", url: "https://testlink.com")
  end

  scenario 'clicking on Edit will take you to a page to edit the link' do
    visit root_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    click_on "Log in"

    click_on "Edit"
    
  end
end