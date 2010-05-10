require 'provider/vimeo'
require 'provider/youtube'
require 'provider/dailymotion'
require 'provider/metacafe'

class VideoInfo
  
  def initialize(url)
    case url
    when /vimeo\.com/
      @video = Vimeo.new(url)
    when /youtube\.com/
      @video = Youtube.new(url)
    when /dailymotion\.com/
      @video = Dailymotion.new(url)
    when /metacafe\.com/
      @video = Metacafe.new(url)
    end
  end
  
  def valid?
    @video != nil && !["", nil].include?(title)
  end
  
  def method_missing(sym, *args, &block)
    @video.send sym, *args, &block
  end
  
end