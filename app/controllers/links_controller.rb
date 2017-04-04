class LinksController < ApplicationController
  before_action :authorize!
  def index
    @links = current_user.links
  end

  def create
    link = Link.create(link_params)
    if link.save
      flash[:success] = "#{link.title} added."
      current_user.links << link
    else
      flash[:danger] = link.errors.full_messages.join(", ")
    end
    redirect_to root_path
  end

  def update
    byebug
  end

  private
    def link_params
      params.permit(:title, :url)
    end
end
