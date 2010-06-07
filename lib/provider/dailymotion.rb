class Dailymotion < Provider

  def initialize(url)
    @video_id = url.gsub(/.*\.com\/video\/([0-9A-Za-z-]+).*$/i, '\1')
    get_info unless @video_id == url
  end
  
private
  
  def get_info
    doc = Nokogiri::XML(open("http://www.dailymotion.com/rss/video/#{@video_id}"))
    @provider         = "Dailymotion"
    @url              = doc.xpath("//item/link").inner_text
    @title            = doc.xpath("//media:title").inner_text
    @description      = doc.xpath("//itunes:summary").inner_text
    @keywords         = doc.xpath("//itunes:keywords").inner_text
    @duration         = doc.xpath("//media:content").first[:duration].to_i
    @width            = doc.xpath("//media:player").first[:width].to_i
    @height           = doc.xpath("//media:player").first[:height].to_i
    @date             = Time.parse(doc.search("pubDate").inner_text, Time.now.utc)
    @thumbnail_small  = doc.xpath("//media:thumbnail").first[:url]
    @thumbnail_large  = doc.xpath("//media:thumbnail").last[:url]
    content           = doc.xpath("//media:content").first
    @player           = content[:url] if content[:type] == "application/x-shockwave-flash"	
  end
  
end