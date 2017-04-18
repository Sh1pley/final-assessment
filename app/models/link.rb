class Link < ActiveRecord::Base
  validates :url, url: true
  belongs_to :user
  validates_presence_of :title, :url

  def self.add_count(link)
    link.counted = true
    if link.count
      link.count += 1
    else
      link.count = 1
    end  
    link.save
  end

  def self.user_hotreads(id)
    where({counted: true, user_id: id})
    .order('count DESC')
    .take(10)
  end

  def self.hotreads
    where({counted: true})
    .order('count DESC')
    .take(10)
  end
end
