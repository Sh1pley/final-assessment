class Api::V1::LinksController < ApplicationController

  def index
    @links = Link.hotreads
    render json: @links
  end

  def update
    @link = Link.find(params[:id])
    Link.add_count(@link)
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:read)
  end
end
