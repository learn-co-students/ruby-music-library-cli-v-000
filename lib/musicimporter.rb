class MusicImporter

  #@@all=[]

  attr_accessor :path

  def initialize(path)
    @path=path
    #@@all<<self
  end

  def files
    #@files= Dir["#{path}/*.mp3"].collect { |f| f.gsub("#{path}/", "") }
    #@files= Dir.glob("#{path}/*.mp3").collect
    @files = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end


  def import
    files.each{ |f| Song.create_from_filename(f) }
  end

end
