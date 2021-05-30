class ShortUrlsController < ApplicationController
  before_action :find_short_url, only: %i[show]
  before_action :create_short_url, only: %i[create]

  layout "application"

  def index
    render partial: 'new'
  end

  def show
    return redirect_to '/404' unless @url

    redirect_to @url.target_url
  end

  def create
    return render partial: 'new', locals: { error: I18n.t('errors.blank_target') } unless @url

    if @url.save
      render partial: 'new', locals: { shorted: @url }, status: :ok
    else
      render partial: 'new', locals: { errors: @url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_short_url
    key = params[:id]
    @url = key ? ShortUrl.find_by(key: key) : nil
  end

  def create_short_url
    url = params[:target_url]
    @url = url ? ShortUrl.find_or_create_by(target_url: url) : nil
  end
end
