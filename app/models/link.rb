class Link < ActiveRecord::Base
  validates :url, url: true
  belongs_to :user
  validates_presence_of :title, :url

  def self.add_count(link)
    link.count = +1
  end

  def self.hotreads
    sort(:count).take(10)
  end
end
