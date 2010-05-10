require 'provider'

# Load providers definitions
dir = File.dirname(__FILE__) + '/provider/'
$LOAD_PATH.unshift(dir)
Dir[File.join(dir, '*.rb')].each {|file| require File.basename(file, File.extname(file))}

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