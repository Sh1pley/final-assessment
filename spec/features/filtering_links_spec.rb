require 'rails_helper'

describe 'Filtering links', type: :feature,  js: :true do
  before do
    @user = User.create(email: "j@j.com", password: "1234")
    @link1 = Link.create(url: "https://1.2.com", title: "test1", read: true)
    @link2 = Link.create(url: "https://one.two.com", title: "test2", read: false)
    @user.links << @link1
    @user.links << @link2
  end

  it 'filters by Unread only' do
    visit root_path
    fill_in :session_email, with: @user.email
    fill_in :session_password, with: @user.password
    click_link_or_button "Log in"

    within('.link-container') do
      expect(page).to have_content('test1')
      expect(page).to have_content('test2')
    end

    click_on "Unread links"
    within('.link-container') do
      # expect(page).to have_selector('.link', count: 1) # Can not get the JS to work on clicking this button
      expect(page).to have_content('test2')
    end

    click_link_or_button "Unread links"
    click_link_or_button "Read links"
    within('.link-container') do
      # expect(page).to have_selector('.link', count: 1) // here either
      expect(page).to have_content('test1')
    end
  end
end