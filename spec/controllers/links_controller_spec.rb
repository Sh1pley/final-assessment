require 'rails_helper'

describe Api::V1::LinksController do
  before :all do
    5.times do
      Link.create(title: Faker::Company.bs, url: Faker::Internet.url, counted: true)
    end
    5.times do
      Link.create(title: Faker::Company.bs, url: Faker::Internet.url)
    end
  end

  it 'returns sorted list of top 10 read links' do
    get :index
    links = JSON.parse(response.body)
    expect(response).to be_success
    expect(links.count).to eq(5)
  end
end