class Link < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :url, :read

end
