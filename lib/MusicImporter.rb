class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") } #look over this code and have someone explain it to me later for more understanding
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
  
end
