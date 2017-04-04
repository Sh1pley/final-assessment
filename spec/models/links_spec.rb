require 'rails_helper'

RSpec.describe Link, type: :model do
  context "link model validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
  end

  context "can validate urls" do
    it "refutes bad urls" do
      link = Link.create(title: "No Good", url: "this.not.com")

      expect(link).to_not be_valid
    end

    it "accepts 'https' formatted urls" do
      link = Link.create(title: "This one's good", url: "https://www.good.org")

      expect(link).to be_valid
    end
  end
end