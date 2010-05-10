require 'nokogiri'
require 'open-uri'

class Provider
  attr_accessor :video_id, :url, :provider, :title, :description, :keywords,
                :duration, :date, :width, :height,
                :thumbnail_small, :thumbnail_large

  def initialize(url)
  end

  private

  def get_info
  end

end