class LinksController < ApplicationController
  before_action :authorize!
  def index
    @links = Link.all
  end

  def create
    link = Link.create(link_params)
    redirect_to root_path
  end

  private
    def link_params
      params.permit(:title, :url)
    end
end
