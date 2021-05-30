# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortUrlsController do
  def show_attributes
    { id: Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  def valid_attributes
    { target_url: Faker::Internet.url }
  end

  describe "GET short_url:show" do
    it "redirects to requested short_url target_url" do
      url = ShortUrl.create! valid_attributes
      get :show, params: { id: url.key }
      response.should redirect_to(url.target_url)
      response.code.should eq '302'
    end

    it "redirects to 404 page if no short_url with key" do
      get :show, params: { id: show_attributes[:id] }
      response.should redirect_to('/404.html')
      response.code.should eq '302'
    end
  end
end
