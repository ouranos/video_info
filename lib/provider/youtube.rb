class Youtube < Provider

  def initialize(url)
    @video_id = url.gsub(/.*v=([^&]+).*$/i, '\1')
    get_info unless @video_id == url
  end
  
private
  
  def get_info
    doc = Nokogiri::XML(open("http://gdata.youtube.com/feeds/api/videos/#{@video_id}"))
    @provider         = "YouTube"
    @url              = "http://www.youtube.com/watch?v=#{@video_id}"
    @player           = "http://www.youtube.com/v/#{@video_id}&fs=1"
    @title            = doc.xpath("//media:title").inner_text
    @description      = doc.xpath("//media:description").inner_text
    @keywords         = doc.xpath("//media:keywords").inner_text
    @duration         = doc.xpath("//yt:duration").first[:seconds].to_i
    @date             = Time.parse(doc.search("published").inner_text, Time.now.utc)
    @thumbnail_small  = doc.xpath('//media:thumbnail[@width="120"]').first[:url]
    @thumbnail_large  = doc.xpath('//media:thumbnail[@width="320"]').last[:url]
  end
  
end