class Link < ActiveRecord::Base
  validates :url, url: true
  belongs_to :user
  validates_presence_of :title, :url

  def self.add_count(link)
      link.counted = true
      link.count += 1
  end

  def self.hotreads
    where({counted: true})
    .order('count DESC')
    .take(10)
  end
end
