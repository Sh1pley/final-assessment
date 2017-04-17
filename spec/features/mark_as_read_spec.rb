require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  before do
    @user = User.create(email: "jesse@j.com", password: "1234")
    link = Link.create(url:"https://turing.io", title:"Turing")
    @user.links << link
  end

  scenario "Mark a link as read" do
    visit login_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    click_on "Log in"
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
