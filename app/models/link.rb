class Link < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :url
  validates :url, :url => true
end
