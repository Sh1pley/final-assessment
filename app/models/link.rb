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

  def self.get_toplink(link)
    toplink = []
    if hotreads[0].url == link.url
      toplink << hotreads[0] 
    end
    return toplink
  end

  def self.user_hotlinks(id)
    userlinks = where({user_id: id})
    hotlinks = []
    userlinks.each do |link|
      hotreads.each do |hot|
        if hot.url == link.url
          hotlinks << link
        end
      end
    end
    links = userlinks - hotlinks.uniq
    toplink = get_toplink(hotlinks[0])
    hot   = hotlinks.uniq - toplink
    
    response = {top: toplink, hot: hot, links: links}
    return response
  end

  def self.hotreads
    where({counted: true})
    .order('count DESC')
    .take(10)
  end
end
