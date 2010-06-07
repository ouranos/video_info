class Vimeo < Provider

  def initialize(url)
    @video_id = url.gsub(/.*\.com\/([0-9]+).*$/i, '\1')
    get_info unless @video_id == url
  end
  
private
  
  def get_info
    doc = Nokogiri::XML(open("http://vimeo.com/api/v2/video/#{@video_id}.xml"))  
    @provider         = "Vimeo"
    @url              = doc.search("url").inner_text
    @player           = "http://vimeo.com/moogaloop.swf?clip_id=#{@video_id}&server=vimeo.com&show_title=1&show_portrait=0&fullscreen=1"
    @title            = doc.search("title").inner_text
    @description      = doc.search("description").inner_text
    @keywords         = doc.search("tags").inner_text
    @duration         = doc.search("duration").inner_text.to_i # seconds
    @width            = doc.search("width").inner_text.to_i
    @height           = doc.search("height").inner_text.to_i
    @date             = Time.parse(doc.search("upload_date").inner_text, Time.now.utc)
    @thumbnail_small  = doc.search("thumbnail_small").inner_text
    @thumbnail_large  = doc.search("thumbnail_large").inner_text
  end
  
end