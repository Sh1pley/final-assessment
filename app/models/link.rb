class Link < ActiveRecord::Base
  validates :url, url: true
  belongs_to :user
  validates_presence_of :title, :url


  def self.hotreads
    where(read: true)
  end
end
