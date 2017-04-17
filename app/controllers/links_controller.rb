class LinksController < ApplicationController
  before_action :authorize!
  def index
    @links = current_user.links
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      flash[:success] = "#{link.title} added."
      render partial: 'layouts/new_link', locals: {link: link}, layout: false
    else
      flash[:danger] = link.errors.full_messages.join(", ")
      render partial: 'layouts/flash'
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    link = current_user.links.find(params[:id])
    if link_params[:title].empty?
      link.update(title: link.title, url: link_params[:url])
    elsif link_params[:url].empty?  
      link.update(title: link_params[:title], url: link.url)
    else
      link.update(link_params)
    end
    redirect_to root_path
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
