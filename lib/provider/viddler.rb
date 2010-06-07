class Viddler < Provider

  def initialize(url)
    raise("You must set the VIDDLER_API_KEY environment variable first !") if ENV['VIDDLER_API_KEY'].nil?
    @video_id = url
    get_info
  end

  def get_info
    doc = Nokogiri::XML(open("http://api.viddler.com/rest/v1/?method=viddler.videos.getDetailsByUrl&api_key=#{ENV['VIDDLER_API_KEY']}&url=#{@video_id}"))
    @provider         = "Viddler"
    @video_id         = doc.xpath("/video/id").inner_text
    @url              = doc.xpath("/video/permalink").inner_text
    @player           = "http://www.viddler.com/player/#{@video_id}/"
    @title            = doc.xpath("/video/title").inner_text
    @description      = doc.xpath("/video/description").inner_text
    @keywords         = doc.xpath("/video/tags").children.collect(&:inner_text).join(", ")
    @duration         = doc.xpath("/video/length_seconds").inner_text.to_i
    @width            = doc.xpath("/video/width").inner_text.to_i
    @height           = doc.xpath("/video/height").inner_text.to_i
    @date             = Time.at(doc.xpath("/video/made_public_time").inner_text[0..-4].to_i)
    @thumbnail_small  = doc.xpath("/video/thumbnail_url").inner_text
    @thumbnail_large  = @thumbnail_small
  end

end