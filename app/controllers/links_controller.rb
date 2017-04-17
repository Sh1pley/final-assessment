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
      render partial: 'layouts/form', locals: {link: link}, layout: false
    else
      flash[:danger] = link.errors.full_messages.join(", ")
    end
    # redirect_to root_path
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    if link_params[:title].empty?
      link.update(title: link.title, url: link_params[:url])
    elsif link_params[:url].empty?  
      link.update(title: link_params[:title], url: link.url)
    else
      link.update(link_params)
    end
    redirect_to root_path
  end

  def update_status
    link = Link.find(params[:id])
    if link.read == true
      link.read = false
    else
      link.read = true
    end
    link.save
    redirect_to root_path
  end

  private
    def link_params
      params.permit(:title, :url)
    end
end
