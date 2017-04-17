require 'rails_helper'

describe Api::V1::LinksController do
  it 'returns sorted list of top 10 read links' do
    get :index

    expect(response).to be_success
  end
end