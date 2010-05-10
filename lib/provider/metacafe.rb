require 'nokogiri'
require 'open-uri'

class Metacafe
  attr_accessor :video_id, :url, :provider, :title, :description, :keywords,
                :duration, :date, :width, :height,
                :thumbnail_small, :thumbnail_large

  def initialize(url)
    @video_id = url.gsub(/.*\.com\/watch\/([0-9]+)\/.*$/i, '\1')
    get_info unless @video_id == url
  end

  def get_info
    doc = Nokogiri::XML(open("http://www.metacafe.com/api/item/#{@video_id}"))
    @provider         = "Metacafe"
    @url              = doc.xpath("//item/link").inner_text
    @title            = doc.xpath("//media:title").inner_text
    @description      = doc.xpath("//media:description").inner_text
    @keywords         = doc.xpath("//media:keywords").inner_text
    @duration         = doc.xpath("//media:content").first[:duration].to_i
    @date             = Time.parse(doc.search("pubDate").inner_text, Time.now.utc)
    @thumbnail_small  = doc.xpath("//media:thumbnail").first[:url]
    @thumbnail_large  = @thumbnail_small
  end
end