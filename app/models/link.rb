class Link < ActiveRecord::Base
  validates :url, url: true
  belongs_to :user
  validates_presence_of :title, :url

  def self.add_count(link)
    link.counted = true
    if link.count != nil
      link.count += 1
    else
      link.count = 1
    end  
  end

  def self.get_toplink(id)
    toplink = []
    if hotreads[0].user_id == id
      toplink << hotreads[0] 
    end
    return toplink
  end

  def self.user_hotlinks(id)
    userlinks = where({user_id: id})
    toplink = get_toplink(id)
    hotlinks = [] 
    hotreads.map do |link| 
      if link.user_id == id
        hotlinks << link
      end
    end
    links = userlinks - hotlinks
    hot   = hotlinks - toplink
    
    response = {top: toplink, hot: hot, links: links}
    return response
  end

  def self.hotreads
    where({counted: true})
    .order('count DESC')
    .take(10)
  end
end
