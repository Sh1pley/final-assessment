class LinksController < ApplicationController
  before_action :authorize!
  def index
    @links = current_user.links
  end

  def create
    link = Link.create(link_params)
    current_user.links << link
    redirect_to root_path
  end

  private
    def link_params
      params.permit(:title, :url)
    end
end
