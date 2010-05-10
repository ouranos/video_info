require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "VideoInfo" do

  describe "from Youtube" do
    subject { VideoInfo.new('http://www.youtube.com/watch?v=mZqGqE0D0n4') }

    its(:provider)         { should == 'YouTube' }
    its(:video_id)         { should == 'mZqGqE0D0n4' }
    its(:url)              { should == 'http://www.youtube.com/watch?v=mZqGqE0D0n4' }
    its(:title)            { should == 'Cherry Bloom - King Of The Knife' }
    its(:description)      { should == 'The first video from the upcoming album Secret Sounds, to download in-stores April 14. Checkout http://www.cherrybloom.net' }
    its(:keywords)         { should == 'cherry, bloom, king, of, the, knife, guitar, drum, clip, rock, alternative, tremplin, Paris-Forum' }
    its(:duration)         { should == 175 }
    its(:width)            { should be_nil }
    its(:height)           { should be_nil }
    its(:date)             { should == Time.parse('Sat Apr 12 22:25:35 UTC 2008') }
    its(:thumbnail_small)  { should == 'http://i.ytimg.com/vi/mZqGqE0D0n4/2.jpg' }
    its(:thumbnail_large)  { should == 'http://i.ytimg.com/vi/mZqGqE0D0n4/0.jpg' }
    it { should be_valid }
  end

  describe "from Youtube" do
    subject { VideoInfo.new('http://www.youtube.com/watch?v=JM9NgvjjVng') }

    its(:provider)         { should == 'YouTube' }
    its(:duration)         { should == 217 }
    it { should be_valid }
  end

  describe "from Vimeo" do
    subject { VideoInfo.new('http://www.vimeo.com/898029') }

    its(:provider)         { should == 'Vimeo' }
    its(:video_id)         { should == '898029' }
    its(:url)              { should == 'http://vimeo.com/898029' }
    its(:title)            { should == 'Cherry Bloom - King Of The Knife' }
    its(:description)      { should == 'The first video from the upcoming album Secret Sounds, to download in-stores April 14. Checkout http://www.cherrybloom.net' }
    its(:keywords)         { should == 'cherry bloom, secret sounds, king of the knife, rock, alternative' }
    its(:duration)         { should == 175 }
    its(:width)            { should == 640 }
    its(:height)           { should == 360 }
    its(:date)             { should == Time.parse('Mon Apr 14 13:10:39 CEST 2008') }
    its(:thumbnail_small)  { should == 'http://ats.vimeo.com/343/731/34373130_100.jpg' }
    its(:thumbnail_large)  { should == 'http://ats.vimeo.com/343/731/34373130_640.jpg' }
    it { should be_valid }
  end

  describe "from Dailymotion" do
      subject { VideoInfo.new('http://www.dailymotion.com/video/x52tk6_cherry-bloom-king-of-the-knife_music') }

      its(:provider)         { should == 'Dailymotion' }
      its(:video_id)         { should == 'x52tk6' }
      its(:url)              { should == 'http://www.dailymotion.com/video/x52tk6_cherry-bloom-king-of-the-knife_music' }
      its(:title)            { should == 'Cherry Bloom - King Of The Knife' }
      its(:description)      { should == 'The first video from the upcoming album Secret Sounds, to download in-stores April 14. Checkout www.cherrybloom.netNo producer, no label, no majorJ...' }
      its(:keywords)         { should == 'cherry, bloom, king, the, knife, secret, sounds, rock, alternative, clip' }
      its(:duration)         { should == 175 }
      its(:width)            { should == 480 }
      its(:height)           { should == 298 }
      its(:date)             { should == Time.parse('Mon, 14 Apr 2008 20:35:02 +0200') }
      its(:thumbnail_small)  { should == 'http://ak2.static.dailymotion.com/static/video/207/925/8529702:jpeg_preview_large.jpg?20100321022950' }
      its(:thumbnail_large)  { should == 'http://ak2.static.dailymotion.com/static/video/207/925/8529702:jpeg_preview_large.jpg?20100321022950' }
      it { should be_valid }
  end

  describe "from Metacafe" do
      subject { VideoInfo.new('http://www.metacafe.com/watch/3982016/hands_on_with_googles_nexus_one_video/') }

      its(:provider)         { should == 'Metacafe' }
      its(:video_id)         { should == '3982016' }
      its(:url)              { should == 'http://www.metacafe.com/watch/3982016/hands_on_with_googles_nexus_one_video/' }
      its(:title)            { should == "Hands on with Google's Nexus One (video)" }
      its(:description)      { should == "CNET's Josh Lowensohn walks through some of the key features of Google's new smartphone, made by HTC." }
      its(:keywords)         { should == 'News,Josh Lowensohn,Google,Google Phone,Android,Cell Phones,Smart Phone,Super Phone,Nexus One' }
      its(:duration)         { should == 225 }
      its(:date)             { should == Time.parse('11-Jan-10 +0000')}
      its(:thumbnail_small)  { should == 'http://s1.mcstatic.com/thumb/3982016/12767900/4/catalog_item5/0/1/hands_on_with_googles_nexus_one_video.jpg?v=10' }
      its(:thumbnail_large)  { should == 'http://s1.mcstatic.com/thumb/3982016/12767900/4/catalog_item5/0/1/hands_on_with_googles_nexus_one_video.jpg?v=10' }
      it { should be_valid }
  end


  describe "from Viddler" do
      subject { VideoInfo.new('http://www.viddler.com/explore/engadget/videos/865/') }

      its(:provider)         { should == "Viddler" }
      its(:video_id)         { should == '9ae1f39' }
      its(:url)              { should == 'http://www.viddler.com/explore/engadget/videos/865/' }
      its(:title)            { should == "Google Nexus One UI walkthrough (Engadget exclusive)" }
      its(:description)      { should == "An exclusive first look at Google's Nexus One UI." }
      its(:keywords)         { should == "one, features, ui, google, android, 2.1, user interface, nexus, walkthrough, nexus one, android 2.1, google nexus one" }
      its(:duration)         { should == 301 }
      its(:width)            { should == 640 }
      its(:height)           { should == 424 }
      its(:date)             { should == Time.at(1262474752) }
      its(:thumbnail_small)  { should == 'http://cdn-thumbs.viddler.com/thumbnail_2_9ae1f39.jpg' }
      its(:thumbnail_large)  { should == 'http://cdn-thumbs.viddler.com/thumbnail_2_9ae1f39.jpg' }
      it { should be_valid }
  end

  it "should be invalid with misstaped url" do
    video = VideoInfo.new('http://www.vimeo.com/1')
    video.should_not be_valid
  end
  
  it "should be invalid with bad url" do
    video = VideoInfo.new('http://www.yasda.com/asdasd')
    video.should_not be_valid
  end
  
  it "should be invalid with blank url" do
    video = VideoInfo.new('')
    video.should_not be_valid
  end
  
  it "should be invalid with nil url" do
    video = VideoInfo.new(nil)
    video.should_not be_valid
  end

end