require 'rails_helper'

RSpec.describe Link, type: :model do
  context "link model validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
    it { should validate_presence_of :read }
  end
end